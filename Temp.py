
# setup - creating database and tables
def setupDb(dbConn):
    dbCursor = dbConn.cursor()
    dbCursor.execute("SHOW DATABASES LIKE 'SchoolFees'")
    databasesAvailable = dbCursor.fetchall()
    if len(databasesAvailable) > 0:
        print("Database already created!")
    else:
        print("Creating database...")
        dbCursor.execute("CREATE DATABASE SchoolFees")
        print("Database SchoolFees created")

    tablesAvailable = dbCursor.execute("SHOW TABLES")
    query = ''
    if "Student" not in tablesAvailable:
        #add create table query to query
        pass
    if "FeeAmountDetail" not in tablesAvailable:
        #append create table to query
        pass
    if "StudentFeeReceiptDetail" not in tablesAvailable:
        # append create table to query
        pass
    if query != '':
        dbCursor.execute(query)
    else:
        print("All tables are already created!!")

# Updating a student record
def updateStudentFeeRecord(dbConn):
    print("-------------------------------Update Student Records-------------------------------------")
    studentClass = int(input("Enter Student Class:"))
    studentSection = input("Enter Student Section:")
    studentRollNo = int(input("Enter Student Roll Number:"))
    fullyPaidFlag = 'N'
    dbCursor = dbConn.cursor(dictionary=True)
    data = (studentClass,studentSection,studentRollNo,fullyPaidFlag)
    getStudentQuery = "Select s.AdmNo as AdmNo, f.StudentFeeReceiptID as StudentFeeReceiptID from s.Student left outer join StudentFeeReceiptDetail where s.Class=%s and s.Section=%s and s.RollNo=%s and FullyPaidFlag = %s"
    try:
        dbCursor.execute(getStudentQuery,data)
        studentRecord = dbCursor.fetchone()
        if studentRecord is None or studentRecord['StudentFeeReceiptID'] is None:
            print("Student fee record not found!!")
            return
        studentAdmissionNumber = studentRecord['AdmNo']
        studentFeeReceiptID = studentRecord['StudentFeeReceiptID']
        newFeePaymentDate = input("Enter Student Fee Payment Date (YYYY-MM-DD):")
        newFeeAmount = float(input("Enter Student Fee Amount:"))
        lateFeeAmount = float(input("Enter Late Fee Amount:"))
        newPaidFlag = input("Is the fee fully paid? (Y/N):")
        data = (newFeePaymentDate,newFeeAmount,lateFeeAmount,newPaidFlag, studentFeeReceiptID, studentAdmissionNumber)
        query = "UPDATE StudentFeeReceiptDetail SET DateOfPayment=%s, FeeAmount=%s, LateCharge=%s, FullyPaidFlag=%s where StudentFeeReceiptID=%s and AdmNo=%s"
        dbCursor.execute(query,data)
        print("Student fee record updated successfully!!")
        dbConn.commit()
    except Exception as e:
        print("Error while updating the student fee record!!")
        print("Error:",e)
        dbConn.rollback()
    finally:
        print("-----------------------------------------------------------------------------------------")

