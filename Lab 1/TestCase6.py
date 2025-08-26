from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import os

# ---- Setup ----
driver = webdriver.Firefox()  
driver.maximize_window()

# Screenshots folder
if not os.path.exists("screenshots"):
    os.makedirs("screenshots")

# ---- LOGIN (no screenshots here, already covered) ----
driver.get("http://localhost/learning-web-technologies-fall2024-2025-sec-b/View/login.php")

driver.find_element(By.NAME, "username").send_keys("saba")
driver.find_element(By.NAME, "password").send_keys("123")
driver.find_element(By.CSS_SELECTOR, "input[type='submit']").click()
time.sleep(2)

# ---- DASHBOARD: BOOK APPOINTMENT ----
driver.find_element(By.XPATH, "//button[text()='Book Appointment']").click()
time.sleep(2)

# ---- BEFORE FILLING FORM ----
driver.save_screenshot("screenshots/1_book_appointment_blank.png")

# ---- FILL FORM ----
driver.find_element(By.ID, "name").send_keys("Saba Ahmed")
driver.find_element(By.ID, "dob").send_keys("1995-08-15")
driver.find_element(By.ID, "gender_female").click()
driver.find_element(By.ID, "phone").send_keys("0171234567")
driver.find_element(By.ID, "email").send_keys("saba@example.com")
driver.find_element(By.ID, "address").send_keys("Dhaka, Bangladesh")

driver.find_element(By.NAME, "appointment_time").send_keys("Monday (9:00-11:00)")
driver.find_element(By.NAME, "instructor").send_keys("Rifat")
driver.find_element(By.NAME, "coursetype").send_keys("basic")
driver.find_element(By.NAME, "location").send_keys("Dhaka")
driver.find_element(By.ID, "nid").send_keys("1234567890")

# ---- AFTER FILLING FORM ----
driver.save_screenshot("screenshots/2_book_appointment_filled.png")

# ---- SUBMIT FORM ----
driver.find_element(By.XPATH, "//button[@type='submit']").click()
time.sleep(2)

# ---- CONFIRMATION PAGE ----
driver.save_screenshot("screenshots/3_book_appointment_confirmation.png")

print("✅ Appointment booking test completed. Screenshots saved.")
driver.quit()
