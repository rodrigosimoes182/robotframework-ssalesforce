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
from BaseObjects import BasePage

from locator import locator_local

locators_by_version = {
    55: locator_local
}
# will get populated in _init_locators
locator_local = {}
@selenium_retry
class (BasePage, SalesforceRobotLibraryBase):

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = 1.0

    def __init__(self, debug=False):
        self.debug = debug
        self.current_page = None
        self._session_records = []
        self.val = 0
        self.payment_list = []
        # Turn off info logging of all http requests
        logging.getLogger('requests.packages.urllib3.connectionpool').setLevel(logging.WARN)
        self._init_locators()
    
    def _init_locators(self):
        try:
            client = self.cumulusci.tooling
            response = client._call_salesforce(
                'GET', 'https://{}/services/data'.format(client.sf_instance))
            self.latest_api_version = float(response.json()[-1]['version'])
            if not self.latest_api_version in locator_local:
                warnings.warn("Could not find locator library for API %d" % self.latest_api_version)
                self.latest_api_version = max(locator_local.keys())
        except RobotNotRunningError:
            # We aren't part of a running test, likely because we are
            # generating keyword documentation. If that's the case, assume
            # the latest supported version
            self.latest_api_version = max(locator_local.keys())
        locators = locator_local[self.latest_api_version]
        locator_local.update(locators)
        