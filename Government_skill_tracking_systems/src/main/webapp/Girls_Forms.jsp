<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Girl Student Information Form</title>

<style>

/* ===== BODY ===== */
/* Google Font */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f3f7fc;
    padding:30px;
    color:#0f172a;
    font-family:'Inter',sans-serif;
}

/*========================
    MAIN CONTAINER
========================*/

.container{
    max-width:1200px;
    margin:auto;
}

/*========================
      HEADER
========================*/

.top-header{
    background:#fff;
    border-radius:18px;
    padding:28px;
    
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:24px;
}

.title-box{
    display:flex;
    align-items:center;
    gap:20px;
}

.logo{
    width:75px;
    height:75px;
    border-radius:50%;
    background:#e7eef8;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:34px;
    color:#0b1f44;
}
.title-box h1{
    font-size:38px;
    color:#0b1f44;
    margin-bottom:10px;
}

.title-box p{
    color:#64748b;
    line-height:1.6;
}
/*========================
      SAFE BOX
========================*/

.safe-box{
    background:#f8fbff;
   
    padding:18px 24px;
    border-radius:14px;
    min-width:320px;
}

.safe-box h3{
    color:#0b1f44;
    margin-bottom:5px;
}

.safe-box p{
    color:#64748b;
    font-size:14px;
    line-height:1.5;
}
.safe-box:hover{
    transform:translateY(-3px);
    box-shadow:0 10px 20px rgba(37,99,235,.15);
}


/*========================
      SECTION
========================*/

.section{
    background:#f5f7fb;
   
    border-radius:18px;
    padding:30px;
    margin-bottom:24px;
    box-shadow:0 2px 8px rgba(0,0,0,.03);
}

.section::before{
    content:"";
    position:absolute;
    left:12px;
    top:10px;
    bottom:10px;
    width:6px;
    background:#0f274d;
    border-radius:20px;
}

.section:hover{
    transform:translateY(-3px);
    box-shadow:0 14px 28px rgba(0,0,0,.08);
}

.section h2{
    font-size:28px;
    color:#0b1f44;
    margin-bottom:25px;
    display:flex;
    align-items:center;
    gap:12px;
}

.section h2::before{
    width:40px;
    height:40px;
    border-radius:10px;
    background:#e7eef8;
}

.section h2::after{
    display:none;
}
/*========================
      ROW
========================*/

.row{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:22px;
    margin-bottom:20px;
}

.col{
    display:flex;
    flex-direction:column;
}
/*========================
      LABEL
========================*/

label{
    display:block;
    margin-bottom:10px;
    font-size:15px;
    font-weight:600;
    color:#1e293b;
}

/*========================
      INPUT
========================*/

input,
select,
textarea{
    width:100%;
    height:54px;
    border:1px solid #cbd5e1;
    border-radius:12px;
    padding:0 16px;
    font-size:15px;
    background:#fff;
    transition:.3s;
}

textarea{
    height:120px;
    padding:14px 16px;
    resize:vertical;
}

input:focus,
select:focus,
textarea:focus{
    border-color:#0b1f44;
    box-shadow:0 0 0 4px rgba(11,31,68,.08);
}
/*========================
     RADIO
========================*/

.radio-group{
    display:flex;
    align-items:center;
    gap:22px;
    height:54px;
    flex-wrap:wrap;
}

.radio-group label{
    display:flex;
    align-items:center;
    gap:8px;
    background:none;
    border:none;
    padding:0;
}

.radio-group input{
    accent-color:#0b1f44;
}
/*========================
      SKILLS
========================*/

.skills-grid{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:18px;
}

.skill-item{
    display:flex;
    align-items:center;
    justify-content:flex-start;
    gap:8px;
    padding:10px 14px;
    background:#fff;
    border:1px solid #cbd5e1;
    border-radius:12px;
    cursor:pointer;
    transition:.3s;
}

.skill-item:hover{
    border-color:#0b1f44;
    background:#f8fbff;
}

/* Small checkbox */
.skill-item input[type="checkbox"]{
    width:16px;
    height:16px;
    margin:0;
    accent-color:#0b1f44;
    flex-shrink:0;
}

/* Label text */
.skill-item span,
.skill-item label{
    font-size:14px;
    font-weight:500;
    color:#1e293b;
    margin:0;
}
/*========================
     CHECKBOX
========================*/

input[type=checkbox],
input[type=radio]{
    accent-color:#4f46e5;
    transform:scale(1.1);
}

/*========================
      BUTTON
========================*/

button{
    background:#0b1f44;
    color:#fff;
    border:none;
    padding:18px 40px;
    font-size:18px;
    font-weight:600;
    border-radius:14px;
    cursor:pointer;
    transition:.3s;
    width:auto;
    display:block;
    margin:30px auto 0;
    box-shadow:0 10px 24px rgba(11,31,68,.18);
}

button:hover{
    background:#132d5f;
    transform:translateY(-2px);
}

/*========================
    SCROLLBAR
========================*/

::-webkit-scrollbar{
    width:10px;
}

::-webkit-scrollbar-thumb{
    background:#4f46e5;
    border-radius:20px;
}

/*========================
     RESPONSIVE
========================*/

@media(max-width:992px){

.top-header{
    flex-direction:column;
    align-items:flex-start;
    gap:20px;
}

.row{
    grid-template-columns:repeat(2,1fr);
}

.safe-box{
    width:100%;
}

.skills-grid{
    grid-template-columns:repeat(2,1fr);
}

}

@media(max-width:640px){

body{
    padding:15px;
}

.row{
    grid-template-columns:1fr;
}

.skills-grid{
    grid-template-columns:1fr;
}

.title-box h1{
    font-size:30px;
}

.section h2{
    font-size:22px;
}

button{
    width:100%;
}

}
</style>
</head>

<body>

<div class="container">

<form action="Girl_Profile_servlet" method="post">

    <!-- HEADER -->
    <div class="top-header">

        <div class="title-box">
            <div class="logo">🎓</div>
            <div>
                <h1>Girl Student Information Form</h1>
                <p>Fill details for scholarships & schemes</p>
            </div>
        </div>

        <div class="safe-box">
            <h3>🔒 Safe</h3>
            <p>Your data used only for schemes</p>
        </div>

    </div>

    <!-- PERSONAL -->
    <div class="section">
        <h2>1. Personal Information</h2>

        <div class="row">

            <div class="col">
                <label>Full Name</label>
                <input type="text" name="name">
            </div>

            <div class="col">
                <label>DOB</label>
                <input type="date" name="dob">
            </div>

            <div class="col">
                <label>Age</label>
                <input type="number" name="age">
            </div>

            <div class="col">
                <label>Gender</label>
                <select name="gender">
                    <option>Female</option>
                    <option>Male</option>
                </select>
            </div>

        </div>

        <div class="row">

            <div class="col">
                <label>Mobile</label>
                <input type="text" name="mobile">
            </div>

            <div class="col">
                <label>Email</label>
                <input type="email" name="email">
            </div>

            

            <div class="col">
                <label>City</label>
                <input type="text" name="city">
            </div>
            <div class="col">
                <label>District</label>
                <input type="text" name="district">
            </div>

        </div>
         <div class="row">
            <div class="col">
                <label>State</label>
                <input type="text" name="state">
            </div>
            
            <div class="col">
                <label>Address</label>
                <input type="text" name="address">
            </div>
             <div class="col">
            </div>
             <div class="col">
            </div>

    </div>

    <!-- EDUCATION -->
    <div class="section">
        <h2>2. Education</h2>

        <div class="row">

            <div class="col">
                <label>Education Level</label>
                <select name="education">
                    <option>School</option>
                     <option>Jr College</option>
                    <option>Diploma</option>
                    <option>Graduate</option>
                    <option>Post Graduate</option>
                </select>
            </div>

            <div class="col">
                <label>Course/Classs</label>
               
                	 <input type="text" name="course">
                    
              
            </div>
            

            <div class="col">
                <label>Year/Sem</label>
             <input type="text" name="year_semester">
                
                   
            </div>

            <div class="col">
                <label>Institution</label>
                <input type="text" name="institution_name">
            </div>

        </div>

        <div class="row">

            <div class="col">
                <label>Mode</label>
                <div class="radio-group">
                    <label><input type="radio" name="mode_of_study" value="Full Time">Full</label>
                    <label><input type="radio" name="mode_of_study" value="Part Time">Part</label>
                    <label><input type="radio" name="mode_of_study" value="Online">Online</label>
                </div>
            </div>

            <div class="col">
                <label>Hostel</label>
                <div class="radio-group">
                    <label><input type="radio" name="hostel_resident" value="Yes">Yes</label>
                    <label><input type="radio" name="hostel_resident" value="No">No</label>
                </div>
            </div>

        </div>

    </div>

    <!-- FAMILY -->
    <div class="section">
        <h2>3. Family</h2>

        <div class="row">

            <div class="col">
                <label>Income</label>
                <select name="family_income">
                    <option>Below 1 Lakh</option>
                    <option>1-2 Lakh</option>
                    <option>2-5 Lakh</option>
                </select>
            </div>

            <div class="col">
                <label>Family Type</label>
                <select name="family_type">
                    <option>Nuclear</option>
                    <option>Joint</option>
                </select>
            </div>

            <div class="col">
                <label>Category</label>
                <select name="category">
                    <option>General</option>
                    <option>OBC</option>
                    <option>SC</option>
                    <option>ST</option>
                     <option>NT</option>
                      <option>SBC</option>
                       <option>SCBC</option>
                        <option>VJ</option>
                </select>
            </div>

        </div>

        <div class="row">
 			<div class="col">
                <label>Parent Occupation</label>
                <input type="text" name="parent_occupation">
            </div>

            <div class="col">
                <label>Disability</label>
                <div class="radio-group">
                    <label><input type="radio" name="differently_abled" value="Yes">Yes</label>
                    <label><input type="radio" name="differently_abled" value="No">No</label>
                </div>
            </div>

           
            <div class="col">
                <label>Gov Benefits</label>
                <div class="radio-group">
                    <label><input type="radio" name="government_benefits" value="Yes">Yes</label>
                    <label><input type="radio" name="government_benefits" value="No">No</label>
                </div>
            </div>

        </div>

    </div>

    <!-- SKILLS -->
    <div class="section">
    <h2>4. Skills</h2>

    <div class="skills-grid">

        <label class="skill-item">
            <input type="checkbox" name="skills" value="Coding">
            <span>Coding</span>
        </label>

        <label class="skill-item">
            <input type="checkbox" name="skills" value="Design">
            <span>Design</span>
        </label>

        <label class="skill-item">
            <input type="checkbox" name="skills" value="Teaching">
            <span>Teaching</span>
        </label>

    </div>

    <div class="skills-grid">

        <label class="skill-item">
            <input type="checkbox" name="interests" value="Music">
            <span>Music</span>
        </label>

        <label class="skill-item">
            <input type="checkbox" name="interests" value="Sports">
            <span>Sports</span>
        </label>

        <label class="skill-item">
            <input type="checkbox" name="interests" value="Reading">
            <span>Reading</span>
        </label>
         <label class="skill-item">
            <input type="checkbox" name="interests" value="Other">
            <span>other</span>
        </label>

    </div>

    <!-- ADDITIONAL -->
    <div class="section">
        <h2>5. Additional</h2>

        <div class="row">

            <div class="col">
                <label>Bank Account</label>
                <div class="radio-group">
                    <label><input type="radio" name="bank_account" value="Yes">Yes</label>
                    <label><input type="radio" name="bank_account" value="No">No</label>
                </div>
            </div>

            <div class="col">
                <label>Laptop Availability</label>
                <div class="radio-group">
                    <label><input type="radio" name="laptop_owned" value="Yes">Yes</label>
                    <label><input type="radio" name="laptop_owned" value="No">No</label>
                </div>
            </div>

            <div class="col">
                <label>Internet Availability</label>
                <div class="radio-group">
                    <label><input type="radio" name="internet_access" value="Yes">Yes</label>
                    <label><input type="radio" name="internet_access" value="No">No</label>
                </div>
            </div>

        </div>

        

    </div>

    <!-- BUTTON -->
    <button type="submit">Save Profile</button>

</form>

</div>

</body>
</html>