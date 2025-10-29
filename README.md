# 🏥 Hospital Analysis Dashboard  
**SQL + Power BI Project by Santhosh Babu**

---

## 📊 Project Overview  
This project presents an end-to-end **Hospital Analysis Dashboard** built using **SQL Views** and **Power BI**, transforming 15 Excel datasets into powerful visual insights.  
It focuses on hospital operations, patient management, doctor performance, and financial trends to support data-driven healthcare decisions.

---

## 🗂️ Data Pipeline  
1. Collected 15 Excel files containing hospital data.  
2. Imported all files into MySQL database `hospital_data`.  
3. Created SQL Views for data cleaning, joining, and transformation.  
4. Connected Power BI to MySQL to build visual dashboards.  
5. Designed KPIs and measures using DAX.  

---

## 🧱 Database Design  
**Database Name:** `hospital_data`  
Includes key views and tables:
- patient_info  
- doctor_info  
- beds_info  
- bills  
- appointments  
- patient_tests  
- medical_stock_info  
- medicine_patient  
- departments  
- satisfaction_score  

---

## 🧠 SQL Views Used  

### 1️⃣ patient_info_view.sql  
Combines patient, doctor, bed, and department data into a single relational view.  
This view helps track patient demographics, assigned doctors, room allocations, and admission status.  

### 2️⃣ medical_stock_info_view.sql  
Integrates medicine and supplier details to provide real-time insights into medicine stock, expiry dates, cost, and reorder levels.  

### 3️⃣ beds_info_view.sql  
Summarizes room and bed occupancy by room type and status (Available / Occupied).  

📂 *All SQL View scripts are stored in the `SQL_Views` folder for easy access and reference.*  

---

## 📸 Dashboard Preview
![Hospital Analysis Dashboard](Screenshots/Hospital_Dashboards.png)

---

## 📈 Dashboards Overview  

### 1️⃣ Overview Dashboard  
- Shows total doctors, patients, staff, and active cases.  
- Highlights hospital summary metrics like admission rate, satisfaction rating, and occupancy rate.  

### 2️⃣ Patient Dashboard  
- Displays patient details, gender distribution, and admission status.  
- Shows discharge trends and test results.  

### 3️⃣ Doctor Dashboard  
- Shows doctor profiles, specializations, and experience.  
- Displays revenue contribution, commission estimation, and patient count.  

### 4️⃣ Hospital Info Dashboard  
- Visualizes bed allocation and room type utilization.  
- Displays patient-to-bed ratio and hospital occupancy.  

### 5️⃣ Finance Dashboard  
- Tracks total bill amount, test charges, medicine charges, and discounts.  
- Analyzes total income vs. expenses and charge type contribution.  

---

## 🧮 Key DAX Measures  

**Total Bill Amount**
```DAX
Total_Bill_Amt =
VAR discount =
    CALCULATE(SUM(Bills[Value]), Bills[Charge_Type] = "discount")
VAR totalamount =
    SUM(Bills[Value])
RETURN
    totalamount - discount
```

**Total Doctors**
```DAX
Total Doctors = DISTINCTCOUNT('patient_info'[doctor_id])
```

**Total Female Patients**
```DAX
Total Female Patients =
CALCULATE(
    COUNTROWS('patient_info'),
    'patient_info'[patient_gender] = "Female"
)
```

**Total Male Patients**
```DAX
Total Male Patients =
CALCULATE(
    COUNTROWS('patient_info'),
    'patient_info'[patient_gender] = "Male"
)
```

**Total Medicine Sales Quantity**
```DAX
Total_Med_Sales_QTY = SUM(medicine_patient[qty])
```

**Total Stock Quantity**
```DAX
Total_Stock_QTY = SUM(Medical_Stock_Info[stock_qty])
```

**Average Star Rating**
```DAX
Sum of satisfaction_rating star rating =
VAR __MAX_NUMBER_OF_STARS = 5
VAR __MIN_RATED_VALUE = 0
VAR __MAX_RATED_VALUE = 5
VAR __BASE_VALUE = SUM('patient_info'[satisfaction_rating])
VAR __NORMALIZED_BASE_VALUE =
	MIN(
		MAX(
			DIVIDE(
				__BASE_VALUE - __MIN_RATED_VALUE,
				__MAX_RATED_VALUE - __MIN_RATED_VALUE
			),
			0
		),
		1
	)
VAR __STAR_RATING = ROUND(__NORMALIZED_BASE_VALUE * __MAX_NUMBER_OF_STARS, 0)
RETURN
	IF(
		NOT ISBLANK(__BASE_VALUE),
		REPT(UNICHAR(9733), __STAR_RATING)
			& REPT(UNICHAR(9734), __MAX_NUMBER_OF_STARS - __STAR_RATING)
	)
```

---

## 💡 Key Insights  
- 73% of patients were successfully discharged.  
- Surgery and medicine sales contribute the most to total revenue.  
- Female patients constitute 46% of total admissions.  
- ICU and general wards have the highest bed utilization.  
- Doctor satisfaction and efficiency increase with patient volume.  

---

## 📧 Contact  
📩 **Santhosh Babu S**  
📊 *Data Analyst Aspirant | Python & Power BI Enthusiast*  
📧 **santhoshbabus.analyst@gmail.com**  

