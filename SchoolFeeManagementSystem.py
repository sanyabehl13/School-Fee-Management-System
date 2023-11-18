import mysql.connector as conn

DB_NAME = 'SchoolFeesManagementSystem'
STUDENT_TABLE = 'Student'
RECEIPT_TABLE = 'StudentFeeReceiptDetail'

# initializing SQL connection
def mySQLConnect(hostname, username, password, db):
    try:
        dbConn = conn.connect(host=hostname,
                              user = username,
                              password = password,
                              database = db)
        return dbConn
    except Exception as e:
        raise e

# Adding a new student
def addStudent(dbConn):
    studentName = input("Enter Student Name:")
    studentClass = int(input("Enter Student Class (1-12):"))
    studentAdmDate = input("Enter Student Admission Date (YYYY-MM-DD):")
    studentSection = input("Enter Student Section (A,B,C,D,E,F):")
    studentRollNo = input("Enter Student Roll Number:")
    data = (studentClass,studentSection,studentAdmDate,studentName, studentRollNo)
    dbCursor = dbConn.cursor(dictionary=True)
    query = "INSERT INTO Student(Class, Section, AdmDate, StudentName, RollNo) values(%s,%s,%s,%s,%s)"
    try:
        dbCursor.execute(query,data)
        print("Student record inserted successfully!!")
        dbConn.commit()

    except Exception as e:
        print("Error while inserting student record!!")
        print("Error:",e)
        dbConn.rollback()

# Adding a new fee record
def addFeeRecord(dbConn):
    # this function will find student admission number on the basis of class and rollno and then update fee record
    studentClass = int(input("Enter Student Class (1-12):"))
    studentSection = input("Enter Student Section (A,B,C,D,E,F):")
    studentRollNo = int(input("Enter Student Roll Number:"))

    # find admission number
    dbCursor = dbConn.cursor(dictionary=True)
    data = (studentClass,studentSection,studentRollNo)
    getStudentQuery = "Select AdmNo from Student where Class=%s and Section=%s and RollNo=%s"
    try:
        dbCursor.execute(getStudentQuery,data)
        studentRecord = dbCursor.fetchone()
        if studentRecord is None:
            print("Student record not found!!")
            return
        # create fee record 
        studentAdmissionNumber = studentRecord['AdmNo']
        studentFeePaymentDate = input("Enter Student Fee Payment Date (YYYY-MM-DD):")
        studentFeeAmount = float(input("Enter Student Fee Amount:"))
        lateFeeAmount = float(input("Enter Late Fee Amount:"))
        fullyPaidFlag = input("Is the fee fully paid? (Y/N):")
        data = (studentAdmissionNumber,studentFeePaymentDate,studentFeeAmount,lateFeeAmount,fullyPaidFlag)
        query = "INSERT INTO StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values(%s,%s,%s,%s,%s)"
        dbCursor.execute(query,data)
        print("Student fee record inserted successfully!!")
        dbConn.commit()
    except Exception as e:
        print("Error while saving the student fee record!!")
        print("Error:",e)
        dbConn.rollback()
    finally:
        print("-----------------------------------------------------------------------------------------")

# Deleting a Student
def deleteStudentFeeRecord(dbConn):
    print("-------------------------------Delete Student Records-------------------------------------")
    print("Note: This will delete the student record and all the fee records before the mentioned date associated with the student where fullyPaidFlag is 'Y'!!")
    studentClass = int(input("Enter Student Class:"))
    studentSection = input("Enter Student Section:")
    studentRollNo = int(input("Enter Student Roll Number:"))
    fullyPaidFlag = 'Y'
    deleteDate = input("Enter the date before which the fee records will be deleted (YYYY-MM-DD):")
    dbCursor = dbConn.cursor(dictionary=True)
    data = (studentClass,studentSection,studentRollNo)
    getStudentAdmNoQuery = "Select AdmNo from Student where Class=%s and Section=%s and RollNo=%s"
    try:
        dbCursor.execute(getStudentAdmNoQuery,data)
        studentRecord = dbCursor.fetchone()
        if studentRecord is None:
            print("Student record not found!!")
            return
        studentAdmissionNumber = studentRecord['AdmNo']
        data = (studentAdmissionNumber,fullyPaidFlag,deleteDate)
        query = "DELETE FROM StudentFeeReceiptDetail where AdmNo=%s and FullyPaidFlag=%s and DateOfPayment<%s"
        dbCursor.execute(query,data)
        print("Student fee records deleted successfully!!")
        dbConn.commit()
    except Exception as e:
        print("Error while deleting the student fee record!!")
        print("Error:",e)
        dbConn.rollback()
    finally:
        print("-----------------------------------------------------------------------------------------")

def getStudentRecords(query, dbConn, data):
    dbCursor = dbConn.cursor(dictionary=True)
    studentRecords = None
    try:
        dbCursor.execute(query, data)
        studentRecords = dbCursor.fetchall()
    except Exception as e:
        print("Error while fetching student records!!")
        print("Error:",e)
    return studentRecords

# Viewing student records
def viewStudentFeeRecord(dbConn):
    print("-------------------------------View Student Records-------------------------------------")
    print("[1] View all student records")
    print("[2] View student records by class")
    print("[3] View student records by class and section")
    print("[4] View a single student record by class, section and roll number")
    print("[5] Return to main menu")
    print("-----------------------------------------------------------------------------------------")
    choice = int(input("Enter your choice:"))
    query = "Select s.AdmNo as AdmNo, s.Class as Class, s.Section as Section, s.AdmDate as AdmDate, s.StudentName as Name, s.RollNo as RollNo, f.StudentFeeReceiptID as StudentFeeReceiptID, f.DateOfPayment as DateOfPayment, f.FeeAmount as FeeAmount, f.LateCharge as LateCharge, f.FullyPaidFlag as FullyPaidFlag  from Student s left outer join StudentFeeReceiptDetail f on s.AdmNo = f.AdmNo" 
    studentRecords = None
    if choice == 2:
        studentClass = int(input("Enter Student Class/Classes:"))
        data = (studentClass,)
        query += " where s.Class in (%s)"
        studentRecords = getStudentRecords(query, dbConn,data)
    elif choice == 3:
        studentClass = int(input("Enter Student Class/Classes:"))
        studentSection = input("Enter Student Section/Sections:")
        data = (studentClass,studentSection)
        query += " where s.Class in (%s) and s.Section in (%s)"
        studentRecords = getStudentRecords(query, dbConn, data)
    elif choice == 1:
        data = ()
        studentRecords = getStudentRecords(query, dbConn,data)
    elif choice == 4:
        studentClass = int(input("Enter Student Class/Classes:"))
        studentSection = input("Enter Student Section/Sections:")
        studentRollNo = int(input("Enter Student Roll Number/Numbers seperated by comma:"))
        data = (studentClass,studentSection,studentRollNo)
        query += " where s.Class in (%s) and s.Section in (%s) and s.RollNo in (%s)"
        studentRecords = getStudentRecords(query, dbConn, data)
    elif choice == 5:
        return
    else:
        print("Wrong choice entered!!")
    if studentRecords is not None:
        print("AdmNo\tClass\tSection\tAdmDate\tName\tRollNo\tStudentFeeReceiptID\tDateOfPayment\tFeeAmount\tLateCharge\tFullyPaidFlag")
        for student in studentRecords:
            #print using tab seperated values and format function
            print("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}\t{8}\t{9}\t{10}".format(student['AdmNo'],student['Class'],student['Section'],student['AdmDate'],student['Name'],student['RollNo'],student['StudentFeeReceiptID'],student['DateOfPayment'],student['FeeAmount'],student['LateCharge'],student['FullyPaidFlag']))
    else:
        print("No Student records found !!")

# main - start of the application
def main():
    hostname = "localhost"
    username = "root"
    password = "password"
    database = DB_NAME

    print("-------------------------------Welcome to SchoolFeeManagementSystem!!-------------------------------------")
    db = mySQLConnect(hostname,username,password,database)
    print("Database connection successful!!")

    #creating cursor object
    dbCursor = db.cursor()
    # setup database
    #setupDb(dbCursor)
    print("Database setup completed!!")

    while True:
        print("-------------------------------Main Menu-------------------------------------")
        print("[1] Add a new Student")
        print("[2] Add Student Fee record")
        print("[3] View Student Fee record")
        print("[4] Delete Student Fee Records")
        print("[5] Exit")
        ch = input("PLEASE ENTER YOUR CHOICE:")

        if ch == '1':
            addStudent(db)
        elif ch == '2':
            addFeeRecord(db)
        elif ch == '3':
            viewStudentFeeRecord(db)
        elif ch == '4':
            deleteStudentFeeRecord(db)
        elif ch=='5':
            break
        else:
            print("Wrong choice entered!!")
    print("BYE BYE!!")
    dbCursor.close()

if __name__ == '__main__':
    main()

