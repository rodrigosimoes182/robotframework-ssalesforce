"""Locators for the las version of SalesForce"""

locator_local={
    'button': '//button[contains(text(),"{}")]',
    'menu': "//a[@lightning-verticalnavigationitembadge_verticalnavigationitembadge and contains(text(), '{}')]",
    'list': "//lightning-formatted-url[contains(.,'{}')]",
    'tab': "//lightning-tab-bar//li/a[contains(.,'{}')]",
    'modal':{
        'input': "//label[contains(text(),'{}')]/parent::div/following-sibling::lightning-input//input",
        'input2': "//*[contains(text(),'{}')]//input",
        'radio': "//*[contains(text(),'{}')]/parent::*/following-sibling::*//*[contains(text(),'{}')]/preceding-sibling::span",
        'radio_status': "//*[contains(text(),'{}')]/parent::*/following-sibling::*//*[contains(text(),'{}')]/preceding-sibling::span/parent::label/preceding-sibling::input",        
        'radio_with_no_label': "//span[contains(text(),'{}')]/preceding-sibling::span",
        'radio_with_no_label_status': "//span[contains(text(),'{}')]/preceding-sibling::span/parent::label/preceding-sibling::input",
        'toogle': "//label[contains(text(),'{}')]/parent::div/following-sibling::lightning-input//span[@data-toggle-description]/span[1]",
        'toogle_status': "//label[contains(text(),'{}')]/parent::div/following-sibling::lightning-input//span[@data-toggle-description]/span[@class='slds-checkbox_{}']",
        'description': "//label[contains(text(), 'Description')]/parent::div/following-sibling::lightning-textarea//textarea",
        'combobox': "//label[contains(text(),'{}')]/parent::div/following-sibling::lightning-combobox//input",
        'combobox_selected': "//div[@lightning-basecombobox_basecombobox and @role='listbox']//span[@title='{}']",
        'combobox_without_label': "//label[contains(text(),'{}')]/parent::div/parent::div/parent::div/following-sibling::div//input",
        'combobox_without_label_selected': "//label[contains(text(),'{}')]/parent::div/parent::div/parent::div/following-sibling::div//span[@title='{}']",
        'process_when_following_expression_is_met': "//textarea[text()='ALL']",        
        'criteria':{                    
            'add_condition': "//span[text()='Add Condition']//parent::button",
            'set_new_condition': "//button[@title='Set a new condition']",
            'select_field': "//button[@title='Select a field']"
            }      
    },
    'detail_page':{
        'text': "//span[(contains(text(),'{}'))]/parent::div/following-sibling::div//lightning-formatted-text",
        'link': "//span[(contains(text(),'{}'))]/parent::div/following-sibling::div//a",
        'number': "//span[(contains(text(),'{}'))]/parent::div/following-sibling::div//lightning-formatted-number"
    },    
    "object": {
        "button": "css: ul.forceActionsContainer.oneActionsRibbon a[title='{}']",    
    }
}
