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

# ---- LOGIN (Silent, no screenshots needed) ----
driver.get("http://localhost/learning-web-technologies-fall2024-2025-sec-b/View/login.php")
driver.find_element(By.NAME, "username").send_keys("saba")
driver.find_element(By.NAME, "password").send_keys("123")
driver.find_element(By.CSS_SELECTOR, "input[type='submit']").click()
time.sleep(2)

# ---- DASHBOARD: Navigate to Report Accident ----
driver.find_element(By.XPATH, "//button[text()='Report Accident']").click()
time.sleep(2)

# ---- REPORT ACCIDENT FORM ----
driver.save_screenshot("screenshots/6_report_accident_form_loaded.png")

# Fill form
driver.find_element(By.ID, "accident_date_time").send_keys("2025-08-17T14:30")
driver.find_element(By.ID, "location").send_keys("Dhaka, Bangladesh")
driver.find_element(By.ID, "vehicle_number").send_keys("DHAKA-METRO-12345")
driver.find_element(By.ID, "description").send_keys("Minor collision, no injuries.")
driver.find_element(By.ID, "photos").send_keys(os.path.abspath(r"C:\Users\TECHNO\Desktop\SOFTWARE-QUALITY-AND-TESTING-A-\Mid Term Assignment Selenium Test Scripts\TestFiles\accident1.jpg"))
driver.find_element(By.ID, "contact").send_keys("0171234567")

driver.save_screenshot("screenshots/7_report_accident_filled.png")

# Submit
driver.find_element(By.XPATH, "//button[@type='submit']").click()
time.sleep(2)

# Confirmation page screenshot
driver.save_screenshot("screenshots/8_report_accident_submitted.png")

print("✅ Accident Report Test Completed. Screenshots saved.")
driver.quit()
