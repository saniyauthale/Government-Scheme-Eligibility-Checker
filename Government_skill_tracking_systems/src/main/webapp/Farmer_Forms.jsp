<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Farmer Information Form</title>

  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    *{
      margin:0;
      padding:0;
      box-sizing:border-box;
      font-family:'Inter',sans-serif;
    }

    body{
      background:#f3f7fc;
      padding:30px;
      color:#0f172a;
    }

    .container{
      max-width:1200px;
      margin:auto;
    }

    /* HEADER */

    .top-header{
      background:#fff;
      border-radius:18px;
      padding:28px;
      border:1px solid #dce5f0;
      display:flex;
      justify-content:space-between;
      align-items:center;
      margin-bottom:24px;
    }

    .header-left{
      display:flex;
      gap:18px;
      align-items:center;
    }

    .header-icon{
      width:75px;
      height:75px;
      border-radius:50%;
      background:#e7eef8;
      display:flex;
      align-items:center;
      justify-content:center;
      font-size:35px;
    }

    .header-content h1{
      font-size:38px;
      color:#0b1f44;
      margin-bottom:10px;
    }

    .header-content p{
      color:#64748b;
      line-height:1.6;
    }

    .safe-box{
      background:#f8fbff;
      border:1px solid #d8e2ee;
      padding:18px 24px;
      border-radius:14px;
      display:flex;
      gap:15px;
      min-width:320px;
    }

    .safe-icon{
      width:42px;
      height:42px;
      border-radius:50%;
      background:#dbe8f7;
      display:flex;
      align-items:center;
      justify-content:center;
      font-size:20px;
    }

    .safe-box h4{
      color:#0b1f44;
      margin-bottom:5px;
    }

    .safe-box p{
      color:#64748b;
      font-size:14px;
      line-height:1.5;
    }

    /* CARD */

    .card{
    background:#f5f7fb;
    border-left:6px solid #14213d;
    border-radius:18px;
    padding:30px;
    margin-bottom:24px;
    box-shadow:0 2px 8px rgba(0,0,0,0.03);
}

    .section-title{
      display:flex;
      align-items:center;
      gap:12px;
      margin-bottom:25px;
    }

    .section-icon{
      width:40px;
      height:40px;
      border-radius:10px;
      background:#e7eef8;
      display:flex;
      align-items:center;
      justify-content:center;
      font-size:18px;
    }

    .section-title h2{
      font-size:28px;
      color:#0b1f44;
    }

    /* FORM GRID */

    .form-grid{
      display:grid;
      grid-template-columns:repeat(4,1fr);
      gap:22px;
    }

    .full-width{
      grid-column:span 2;
    }

    .input-group label{
      display:block;
      margin-bottom:10px;
      font-weight:600;
      font-size:15px;
      color:#1e293b;
    }

    .required{
      color:red;
    }

    input,
    select{
      width:100%;
      height:54px;
      border:1px solid #cbd5e1;
      border-radius:12px;
      padding:0 16px;
      font-size:15px;
      transition:0.3s;
      outline:none;
      background:#fff;
    }

    input:focus,
    select:focus{
      border-color:#0b1f44;
      box-shadow:0 0 0 4px rgba(11,31,68,0.08);
    }

    /* RADIO */

    .radio-group{
      display:flex;
      align-items:center;
      gap:22px;
      height:54px;
    }

    .radio-group label{
      display:flex;
      align-items:center;
      gap:8px;
      font-weight:500;
      color:#475569;
      cursor:pointer;
    }

    .radio-group input{
      width:auto;
      height:auto;
      accent-color:#0b1f44;
    }

    /* GUIDE */

    .guide-box{
      margin-top:24px;
      background:#f8fbff;
      border:1px solid #d8e2ee;
      padding:16px 20px;
      border-radius:12px;
      color:#475569;
    }

    .guide-box strong{
      color:#0b1f44;
    }

    /* NOTE */

    .note-box{
      background:#fffdf4;
      border:1px solid #f3e4a8;
      border-radius:18px;
      padding:24px;
      display:flex;
      justify-content:space-between;
      align-items:center;
      margin-top:10px;
    }

    .note-box h4{
      color:#a16207;
      margin-bottom:8px;
    }

    .note-box p{
      color:#57534e;
      line-height:1.7;
    }

    .tractor{
      font-size:70px;
    }

    /* BUTTON */

    .btn-wrap{
      text-align:center;
      margin-top:28px;
    }

    .submit-btn{
      background:#0b1f44;
      color:#fff;
      border:none;
      padding:18px 40px;
      font-size:18px;
      font-weight:600;
      border-radius:14px;
      cursor:pointer;
      transition:0.3s;
      box-shadow:0 10px 24px rgba(11,31,68,0.18);
    }

    .submit-btn:hover{
      background:#132d5f;
      transform:translateY(-2px);
    }

    /* RESPONSIVE */

    @media(max-width:992px){

      .top-header{
        flex-direction:column;
        align-items:flex-start;
        gap:20px;
      }

      .safe-box{
        width:100%;
      }

      .form-grid{
        grid-template-columns:repeat(2,1fr);
      }
    }

    @media(max-width:640px){

      body{
        padding:15px;
      }

      .form-grid{
        grid-template-columns:1fr;
      }

      .full-width{
        grid-column:span 1;
      }

      .header-content h1{
        font-size:30px;
      }

      .section-title h2{
        font-size:22px;
      }

      .note-box{
        flex-direction:column;
        text-align:center;
        gap:20px;
      }
    }

  </style>
</head>

<body>

<div class="container">

  <!-- HEADER -->
<form action="Farmer_Profile_servelet" method="post">

    <input type="hidden"
           name="userId"
           value="<%= request.getParameter("userId") %>">
           
   <p>User ID received: <%= request.getParameter("userId") %></p>
  <div class="top-header">

    <div class="header-left">

      <div class="header-icon">
        👨‍🌾
      </div>

      <div class="header-content">
        <h1>Farmer Information Form</h1>
        <p>
          Please provide accurate information to check your eligibility
          <br>
          for government schemes.
        </p>
      </div>

    </div>

    <div class="safe-box">

      <div class="safe-icon">🛡️</div>

      <div>
        <h4>Your Information is Safe</h4>
        <p>
          We use your information only to find eligible schemes for you.
        </p>
      </div>

    </div>

  </div>

  <!-- PERSONAL DETAILS -->

  <div class="card">

    <div class="section-title">
      <div class="section-icon">👤</div>
      <h2>1. Personal Details</h2>
    </div>

    <div class="form-grid">

      <div class="input-group">
        <label>Full Name <span class="required">*</span></label>
        <input type="text" name="full_name" placeholder="Enter your full name">

      </div>

      <div class="input-group">
        <label>Age <span class="required">*</span></label>
        <input type="number" name="age" placeholder="Enter age">
      </div>

      <div class="input-group">
        <label>Gender <span class="required">*</span></label>
        <select name="gender">
          <option>Select Gender</option>
          <option>Male</option>
          <option>Female</option>
          <option>Other</option>
        </select>
      </div>

      <div class="input-group">
        <label>Mobile Number <span class="required">*</span></label>
        <input type="text" name="mobile" placeholder="Enter mobile number">
      </div>

      <div class="input-group">
        <label>State <span class="required">*</span></label>
        <input type="text" name="state" placeholder="Enter State">

      </div>

      <div class="input-group">
        <label>District <span class="required">*</span></label>
      <input type="text" name="district"
       placeholder="Enter District">
      </div>

      <div class="input-group full-width">
        <label>Village <span class="required">*</span></label>
       <input type="text" name="village"
       placeholder="Enter village name">
      </div>

    </div>
  </div>

  <!-- FARMING DETAILS -->

  <div class="card">

    <div class="section-title">
      <div class="section-icon">🌾</div>
      <h2>2. Farming Details</h2>
    </div>

    <div class="form-grid">

      <div class="input-group">
        <label>Farmer Type <span class="required">*</span></label>
       <select name="farmer_type">
          <option value="">Select Farmer Type</option>

    <option value="Small Farmer">
        Small Farmer (0 - 2 Acres)
    </option>

    <option value="Marginal Farmer">
        Marginal Farmer (2 - 5 Acres)
    </option>

    <option value="Medium Farmer">
        Medium Farmer (5 - 10 Acres)
    </option>

    <option value="Large Farmer">
        Large Farmer (Above 10 Acres)
    </option>

    <option value="Tenant Farmer">
        Tenant Farmer
    </option>

        </select>
      </div>

      <div class="input-group">
        <label>Land Holding (in acres) <span class="required">*</span></label>
       <input type="number"
       
       name="land_holding"
       placeholder="Enter land in acres">

      </div>

      <div class="input-group">
        <label>Main Crop Type <span class="required">*</span></label>
        <input type="text" name="main_crop"
       placeholder="Enter main crop">
      </div>

      <div class="input-group">
        <label>Irrigation Facility <span class="required">*</span></label>

        <div class="radio-group">
          <label><input type="radio" name="irrigation" value="Yes"> Yes</label>
          <label><input type="radio" name="irrigation" value="No"> No</label>
        </div>

      </div>

      <div class="input-group">
        <label>Annual Income from Farming <span class="required">*</span></label>
        <select name="annual_income">
           <option value="">Select Income Range</option>

    <option value="Below 50000">
        Below ₹50,000
    </option>

    <option value="50000-100000">
        ₹50,000 - ₹1,00,000
    </option>

    <option value="100000-300000">
        ₹1,00,000 - ₹3,00,000
    </option>

    <option value="300000-500000">
        ₹3,00,000 - ₹5,00,000
    </option>

    <option value="500000-1000000">
        ₹5,00,000 - ₹10,00,000
    </option>

    <option value="Above 1000000">
        Above ₹10,00,000
    </option>
        </select>
      </div>

      <div class="input-group">
        <label>Do you have Kisan Credit Card? <span class="required">*</span></label>

        <div class="radio-group">
          <label><input type="radio" name="kisan" value="Yes"> Yes</label>
          <label><input type="radio" name="kisan" value="No"> No</label>
        </div>

      </div>

      <div class="input-group">
        <label>Do you own Farm Machinery? <span class="required">*</span></label>

        <div class="radio-group">
          <label><input type="radio" name="machine" value="Yes"> Yes</label>
          <label><input type="radio" name="machine" value="No"> No</label>
        </div>

      </div>

    </div>

    <div class="guide-box">
      <strong>Farmer Type Guide:</strong>
      Small (0 – 2 acres) |
      Marginal (2 – 5 acres) |
      Large (Above 5 acres)
    </div>

  </div>

  <!-- CATEGORY DETAILS -->

  <div class="card">

    <div class="section-title">
      <div class="section-icon">🧾</div>
      <h2>3. Category Details</h2>
    </div>

    <div class="form-grid">

      <div class="input-group">
        <label>Category <span class="required">*</span></label>
        <select name="category">
          <option value="">Select Category</option>

    <option value="General">General</option>

    <option value="OBC">OBC</option>

    <option value="SC">SC</option>

    <option value="ST">ST</option>

    <option value="Minority">Minority</option>

    <option value="Economically Weaker Section">
        Economically Weaker Section (EWS)
    </option>

        </select>
      </div>

      <div class="input-group">
        <label>Member of Farmer Group/Cooperative?</label>

        <div class="radio-group">
          <label><input type="radio" name="group" value="Yes"> Yes</label>
          <label><input type="radio" name="group" value="No"> No</label>
        </div>

      </div>

      <div class="input-group">
        <label>Person with Disability?</label>

        <div class="radio-group">
          <label><input type="radio" name="disability" value="Yes"> Yes</label>
          <label><input type="radio" name="disability" value="No"> No</label>
        </div>

      </div>

    </div>

  </div>

  <!-- ADDITIONAL -->

  <div class="card">

   

    <div class="form-grid">

      <div class="input-group">
        <label>Any other source of income?</label>

        <div class="radio-group">
          <label><input type="radio" name="income" value="Yes"> Yes</label>
          <label><input type="radio" name="income" value="No"> No</label>
        </div>

      </div>

      <div class="input-group">
        <label>Have you availed government scheme before?</label>

        <div class="radio-group">
          <label><input type="radio" name="scheme" value="Yes"> Yes</label>
          <label><input type="radio" name="scheme" value="No"> No</label>
        </div>

      </div>

      <div class="input-group">
        <label>Scheme Name (Optional)</label>
        <input type="text" name="scheme_name" placeholder="Enter scheme name">
      </div>

    </div>

  </div>

  <!-- NOTE -->

  <div class="note-box">

    <div>
      <h4>⚠ Please Note:</h4>

      <p>
        The information you provide will be used only to determine your eligibility for government schemes.
        <br>
        You will be shown only the schemes you are eligible for.
      </p>
    </div>

    <div class="tractor">🚜</div>

  </div>

  <!-- BUTTON -->

  <div class="btn-wrap">
    <button class="submit-btn">
      ✔ Login & Check Eligible Schemes
    </button>
  </div>

</div>

</body>
</html>