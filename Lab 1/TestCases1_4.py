from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
import time
import os

# --- Setup ---
driver = webdriver.Firefox()  
driver.maximize_window()

if not os.path.exists("screenshots"):
    os.makedirs("screenshots")

print("✅ Browser launched successfully.")

# --- Step 1: Open Login Page ---
driver.get("http://localhost/learning-web-technologies-fall2024-2025-sec-b/View/login.php")
time.sleep(1)
driver.save_screenshot("screenshots/0_login_page.png")
print("✅ Login page opened and screenshot saved.")

# Fill login form
driver.find_element(By.NAME, "username").send_keys("saba")
driver.find_element(By.NAME, "password").send_keys("123")
driver.save_screenshot("screenshots/1_login_filled.png")
print("✅ Login form filled with username and password (screenshot taken).")

# Submit login form
driver.find_element(By.XPATH, "//input[@type='submit']").click()
time.sleep(2)
driver.save_screenshot("screenshots/2_dashboard.png")
print("✅ Logged in and dashboard opened (screenshot taken).")

# --- Step 2: Go to Apply License ---
driver.find_element(By.XPATH, "//a[@href='../View/Apply_license.php']/button").click()
time.sleep(2)
driver.save_screenshot("screenshots/3_apply_license_page.png")
print("✅ Navigated to 'Apply License' page (screenshot taken).")

# --- Step 3: Fill License Application Form ---
driver.find_element(By.ID, "name").send_keys("John Doe")
driver.find_element(By.ID, "fname").send_keys("Richard Doe")
driver.find_element(By.ID, "dob").send_keys("1995-06-15")
driver.find_element(By.ID, "phone").send_keys("0123456789")
driver.find_element(By.ID, "email").send_keys("john.doe@example.com")
driver.find_element(By.ID, "address").send_keys("123 Main Street, Dhaka")
driver.find_element(By.ID, "nid").send_keys("1234567890123")

# Select dropdowns
Select(driver.find_element(By.NAME, "bloodgroup")).select_by_visible_text("O+")
Select(driver.find_element(By.NAME, "licensetype")).select_by_value("professional")

# Select gender radio
driver.find_element(By.ID, "gender_male").click()
time.sleep(1)
driver.save_screenshot("screenshots/4_license_form_filled.png")
print("✅ License application form filled (screenshot taken).")

# Submit the form
driver.find_element(By.XPATH, "//button[@type='submit']").click()
time.sleep(2)

# --- Step 4: Upload Files on Apply_license2.php ---
driver.save_screenshot("screenshots/5_files_upload_page.png")
print("✅ Apply License Step 2 page opened (screenshot taken).")

driver.find_element(By.ID, "picture").send_keys(r"C:\Users\TECHNO\Desktop\SOFTWARE-QUALITY-AND-TESTING-A-\Mid Term Assignment Selenium Test Scripts\TestFiles\picture.jpg")
driver.find_element(By.ID, "nid-front").send_keys(r"C:\Users\TECHNO\Desktop\SOFTWARE-QUALITY-AND-TESTING-A-\Mid Term Assignment Selenium Test Scripts\TestFiles\nid_front.jpg")
driver.find_element(By.ID, "nid-back").send_keys(r"C:\Users\TECHNO\Desktop\SOFTWARE-QUALITY-AND-TESTING-A-\Mid Term Assignment Selenium Test Scripts\TestFiles\nid_back.jpg")
driver.find_element(By.ID, "medical-report").send_keys(r"C:\Users\TECHNO\Desktop\SOFTWARE-QUALITY-AND-TESTING-A-\Mid Term Assignment Selenium Test Scripts\TestFiles\medical_report.pdf")

time.sleep(1)
driver.save_screenshot("screenshots/6_files_uploaded.png")
print("✅ All files uploaded (screenshot taken).")

# Submit files
driver.find_element(By.XPATH, "//button[@type='submit']").click()
time.sleep(3)
driver.save_screenshot("screenshots/7_license_process_done.png")
print("✅ License application submitted successfully (screenshot taken).")

# --- Step 5: Finish ---
driver.quit()
print("\n🎯 Test Completed. All screenshots saved in the 'screenshots/' folder.")
