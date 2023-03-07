# Builder
    [] Names of Owners : Array of Strings
    [] Organisation Name : String
    [] Address of Main Office : String
    [] isVerified : boolean
    [] Main acccount of Ethereum
    [] Employees : Array of types
        types : {type: 'String', list: Array of Objects(Accoutant)}
    [] Building : Array of Objects

# Building
    [] City : String
    [] Area : String
    [] Apartment : String
    [] Block No. : Int
    [] Total no of flats : Int
    [] Types of flat : {'1BHK', '2BHK', '3BHK'}
    [] Total no. of floors : Int
    [] flats : 
    [] Rent : Int
    [] Agreement Limit : Int (Years)
    [] Security Limit : Int (Months)
    [] Maintainance : Int (Rupees)
    [] WaterBillUnit : Int (/L)
    [] GasUnit : Int (/Gallon)
    [] SecurityGuard : Int (Rupees)
    [] oneTimeSiteFee : Int (Rupees)

# Tenant
    [] Name : String
    [] AuthId : String
    [] Document Id : String
    [] AgreementAddress : String
    [] isFinished : Bool

# Employees of Builder
    [] Builder --> Adding the buildings
    [] Accountant --> Managing the rents and agreement related issues
    [] Site Walker --> Manages the site visit related issues

# Accountant
    [] Name of Accoutant : String
    [] Aadhar No of Accountant : Number of String
    [] Address of Accoutant : String
    [] Date of Joining : Timestamp
    [] Salary : Int (Rupees)

# Site Walker
    [] Name of Accoutant : String
    [] Phone Numer : String
    [] Photo : Link
    [] Aadhar No of Accountant : Number of String
    [] Address of Accoutant : String
    [] Date of Joining : Timestamp
    [] Salary : Int (Rupees)

# Flat
{
    floors: {
        1: {
            roomNo : {101, 103, 105, 109, 104},
            limit: 10,
            occupied: 5
        }
    }
}

User -> City -> Area -> Buildings [Blocks]
Area --> Sector 62
Saga --> Block 1 Block 2 Block 3

Saga --> (Visit)

Block 1
1 --> Empty
2 --> Empty
3 --> 

Available Rooms

Object.values(objectName)