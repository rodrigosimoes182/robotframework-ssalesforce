import time
from datetime import date
import logging
import warnings
import re
import time

from robot.libraries.BuiltIn import RobotNotRunningError
from robot.libraries.BuiltIn import BuiltIn
from SeleniumLibrary.errors import ElementNotFound, SeleniumLibraryException
from cumulusci.tasks.apex.anon import AnonymousApexTask
from cumulusci.core.config import TaskConfig
from cumulusci.robotframework.utils import selenium_retry
from cumulusci.robotframework.utils import capture_screenshot_on_error
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.common.exceptions import TimeoutException
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import StaleElementReferenceException
from selenium.common.exceptions import ElementNotVisibleException
from selenium.common.exceptions import ElementClickInterceptedException
from selenium.common.exceptions import NoSuchElementException

from tasks.salesforce_robot_library_base import SalesforceRobotLibraryBase
from BaseObjects import BaseFieloPage

from locator import locator_local

locators_by_version = {
    55: locator_local
}