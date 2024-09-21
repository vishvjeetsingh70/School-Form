<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDesign.aspx.cs" Inherits="School_Form.FormDesign" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Excursion Consent</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background-image: url("images/images.jpeg");
            background-repeat: repeat;
        }

        .container {
            width: 80%;
            margin: 10px 10px 50px 10px;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(1, 107, 121, 09);
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form runat="server">
        <div class="container mt-5">
            <div class="text-center mb-4">
                <img src="images/children-playing-with-pencil-girl-reading-book_679557-2874.png" alt="Student Image" width="400px" />
                <h1>School Excursion Consent</h1>
                <p class="text-muted">Provide consent for your child to participate in the school excursion. Please upload any relevant documents that have been requested.</p>
            </div>

            <asp:Panel ID="FormPanel" runat="server">
                <div class="row mb-3">
                    <div class="col-md-6 ">
                        <asp:Label class="form-label" runat="server">Student Name</asp:Label>
                        <asp:TextBox ID="txtStudentFirstName" runat="server" CssClass="form-control " placeholder="First Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="* First Name Is Required" ControlToValidate="txtStudentFirstName" runat="server" ForeColor="Red" Display="Dynamic" />
                    </div>
                    <div class="col-md-6">
                        <asp:Label class="form-label" runat="server">&nbsp;</asp:Label>
                        <asp:TextBox ID="StudentLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="* Last Name Is Required" ControlToValidate="StudentLastName" runat="server" ForeColor="Red" Display="Dynamic" />

                    </div>
                </div>

                <div class="mb-3">
                    <asp:Label class="form-label" runat="server">Student Grade</asp:Label>
                    <asp:DropDownList ID="StudentGrade" runat="server" CssClass="form-select">
                        <asp:ListItem Text="- Select Grade -" Value="0" />
                        <asp:ListItem Text="Grade A" Value="Grade-A" />
                        <asp:ListItem Text="Grade B" Value="Grade-B" />
                    </asp:DropDownList>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:Label class="form-label" runat="server">Parent/Legal Guardian Name</asp:Label>
                        <asp:TextBox ID="ParentFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label class="form-label" runat="server">&nbsp;</asp:Label>
                        <asp:TextBox ID="ParentLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                    </div>
                </div>
                <div class="mb-3">
                    <asp:Label class="form-label" runat="server">Contact</asp:Label>
                    <asp:TextBox ID="contact" runat="server" CssClass="form-control" placeholder="Contact"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label class="form-label" runat="server">Emergency Contact</asp:Label>
                    <asp:TextBox ID="EmergencyContact" runat="server" CssClass="form-control" placeholder="Emergency Contact"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <asp:TextBox ID="StreetAddress" runat="server" CssClass="form-control mb-2" placeholder="Street Address"></asp:TextBox>
                    <asp:TextBox ID="AddressLine2" runat="server" CssClass="form-control mb-2" placeholder="Address Line 2"></asp:TextBox>

                    <%--COUNTRY--%>
                    <div class="mb-3">
                        <asp:DropDownList runat="server" ID="ddlCountry" CssClass="form-select mb-2" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <%--STATES--%>
                    <div class="mb-3">
                        <asp:DropDownList ID="StateRegion" runat="server" CssClass="form-select mb-2" OnSelectedIndexChanged="StateRegion_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <div class="row">
                        <%--CITY--%>
                        <div class="col-md-6">
                            <asp:DropDownList runat="server" ID="ddlCity" CssClass="form-select mb-2">
                            </asp:DropDownList>
                        </div>
                        <%--PINCODE--%>
                        <div class="col-md-6">
                            <asp:TextBox ID="PostalCode" runat="server" CssClass="form-control mb-2" placeholder="Postal / Zip Code"></asp:TextBox>
                        </div>


                    </div>


                </div>

                <div class="mb-3">
                    <asp:Label runat="server" Class="form-label">&#9679; Excursion place<span style="color:red; font-size:22px;">*</span></asp:Label>
                    <asp:RadioButtonList runat="server" ID="ExcursionPlace" Class="form-check">
                        <asp:ListItem Text="First Choice" Value="First Choice"></asp:ListItem>
                        <asp:ListItem Text="Second Choice" Value="Second Choice"></asp:ListItem>
                        <asp:ListItem Text="Third Choice" Value="Third Choice"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="mb-3">
                    <asp:Label class="form-label" runat="server">&#9679; Is your child subject to any medical condition?<span style="color:red; font-size:22px;">*</span></asp:Label>
                    <asp:RadioButtonList runat="server" ID="radioMedical" Class="form-check" AutoPostBack="true" OnSelectedIndexChanged="radioMedical_SelectedIndexChanged1">
                        <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="mb-3">
                    <asp:Panel runat="server" Class="mb-3" ID="txtProvideMedicalInfo" Visible="false">
                        <asp:Label class="form-label" runat="server">&#9679;Please provide the medical details<span style="color:red; font-size:22px;">*</span></asp:Label>
                        <asp:TextBox ID="MedicalDetails" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter medical details here..."></asp:TextBox>
                    </asp:Panel>
                </div>

                <div class="mb-3">
                    <asp:Label runat="server" Class="form-label">&#9679; Meal Requirement<span style="color:red; font-size:22px;">*</span></asp:Label>
                    <asp:RadioButtonList runat="server" ID="MealRequirement" Class="form-check">
                        <asp:ListItem Text="Veg" Value="Veg"></asp:ListItem>
                        <asp:ListItem Text="Non-Veg" Value="Non-Veg"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="mb-3">
                    <asp:Label runat="server" Class="form-label">&#9679; Is your child allergic to any food?<span style="color:red; font-size:22px;">*</span></asp:Label>
                    <asp:RadioButtonList runat="server" ID="FoodAllergy" CssClass="form-check" AutoPostBack="true" OnSelectedIndexChanged="FoodAllergy_SelectedIndexChanged">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="mb-3">
                    <asp:Panel runat="server" ID="txtFoodAllergyDetails" Visible="false">
                        <asp:Label class="form-label" runat="server">&#9679; Please provide the details of food allergy<span style="color:red; font-size:22px;">*</span></asp:Label>
                        <asp:TextBox ID="FoodAllergyDetails" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter details of food allergy here..."></asp:TextBox>
                    </asp:Panel>
                </div>

                <div class="mb-3">
                    <asp:Label for="VaccinationReport" class="form-label" runat="server">&#9679; Attach your child's vaccination report<span style="color:red; font-size:22px;">*</span></asp:Label>
                    <asp:FileUpload ID="VaccinationReport" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3 form-check">
                    <asp:CheckBox ID="ConsentCheckBox" runat="server" CssClass="form-input" />
                    <asp:Label class="form-check-label" for="ConsentCheckBox" runat="server">I give my consent for my child to participate in the school excursion. I am aware of the nature of the activity and agree to entrust my authority to the staff and other individuals in charge.</asp:Label>
                </div>

                <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-success w-100" Text="Submit" OnClick="SubmitButton_Click" />
            </asp:Panel>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
