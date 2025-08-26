from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time, os

# ---- Setup ----
driver = webdriver.Firefox()  
driver.maximize_window()

# Screenshots folder
if not os.path.exists("screenshots"):
    os.makedirs("screenshots")

# ---- LOGIN (already tested, but required for session) ----
driver.get("http://localhost/learning-web-technologies-fall2024-2025-sec-b/View/login.php")
driver.find_element(By.NAME, "username").send_keys("saba")
driver.find_element(By.NAME, "password").send_keys("123")
driver.find_element(By.CSS_SELECTOR, "input[type='submit']").click()
time.sleep(2)

# ---- NAVIGATE TO APPLY ROAD PERMIT ----
driver.find_element(By.XPATH, "//button[text()='Apply for Road Permit']").click()
time.sleep(2)

# Screenshot before filling form
driver.save_screenshot("screenshots/permit_before.png")

# ---- FILL ROAD PERMIT FORM ----
driver.find_element(By.ID, "name").send_keys("Saba Ahmed")
driver.find_element(By.ID, "nid").send_keys("1234567890")
driver.find_element(By.ID, "email").send_keys("saba@example.com")
driver.find_element(By.ID, "phone").send_keys("0171234567")
driver.find_element(By.ID, "address").send_keys("Dhaka, Bangladesh")
driver.find_element(By.NAME, "vehicletype").send_keys("car")
driver.find_element(By.ID, "reg_num").send_keys("DHAKA-12345")
driver.find_element(By.ID, "start_point").send_keys("Dhaka")
driver.find_element(By.ID, "end_point").send_keys("Chittagong")

# Upload documents
driver.find_element(By.ID, "vehicleRegDoc").send_keys(os.path.abspath(r"C:\Users\TECHNO\Desktop\SOFTWARE-QUALITY-AND-TESTING-A-\Mid Term Assignment Selenium Test Scripts\TestFiles\vehiclereg.jpg"))
driver.find_element(By.ID, "insuranceCert").send_keys(os.path.abspath(r"C:\Users\TECHNO\Desktop\SOFTWARE-QUALITY-AND-TESTING-A-\Mid Term Assignment Selenium Test Scripts\TestFiles\insurance.jpg"))

# Screenshot after filling form
driver.save_screenshot("screenshots/permit_filled.png")

# ---- SUBMIT FORM ----
driver.find_element(By.XPATH, "//button[@type='submit']").click()
time.sleep(2)

# Screenshot after submission (permit_process.php page)
driver.save_screenshot("screenshots/permit_submitted.png")

print("✅ Road Permit Test Completed. Screenshots saved in 'screenshots/' folder.")
driver.quit()
