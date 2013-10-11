// element identifiers 
var captchaImageId = 'SampleForm_CaptchaImage';
var codeTextboxId = 'CaptchaCode';
var errorLabelId = 'CodeIncorrectLabel';
var formId = 'SampleForm';

// other settings
var validationPrompt = 'validating...';
var ajaxTimeoutMiliseconds = 5000;

// shared variable declarations
var LBD_ValidationResult = false;
var LBD_ValidationRequest = null;
var LBD_CodeInput = null;
var LBD_ValidationPrompt = null;
var LBD_ErrorPrompt = null;
var LBD_PromptParent = null;

function LBD_Validate() 
{
  if(!LBD_ValidationResult) 
  { // only validate the CAPTCHA if it isn't already passed
  
    // init elements
    LBD_CodeInput = document.getElementById(codeTextboxId);
    LBD_ErrorPrompt = document.getElementById(errorLabelId);
    LBD_PromptParent = LBD_ErrorPrompt.parentNode;
    
    if(!LBD_CodeInput || !LBD_CodeInput.value || LBD_CodeInput.value.length < 0) 
    { // validation fails if there is no user input
      LBD_EndValidation(false);
      LBD_CodeInput.focus();
    } 
    else 
    { // Ajax validation
      LBD_StartValidation();
    }
  }
  return LBD_ValidationResult;
}

function LBD_StartValidation() 
{
  // hide the error message
  LBD_ErrorPrompt.style.visibility = 'hidden';
  
  // show the validation status indicator
  LBD_ValidationPrompt = document.createElement('span');
  LBD_ValidationPrompt.id = 'LBD_ValidatingPrompt';
  LBD_ValidationPrompt.appendChild(document.createTextNode(validationPrompt));
  LBD_PromptParent.appendChild(LBD_ValidationPrompt);

  // send the user input to the server for validation
  LBD_ValidateCode(LBD_CodeInput.value, LBD_EndValidation);
}

function LBD_ValidateCode(code, callback) 
{
  // set Ajax request timeout treshold
  $.ajaxSetup( { 
    timeout : ajaxTimeoutMiliseconds
  } );
  
  // send CAPTCHA validation request
  LBD_ValidationRequest = $.getJSON( "LanapBotDetectHandler.asp", // server path
    { Command: "Validate", Code: code }, // querystring params
    function(json) { LBD_ProcessValidationResult(json.result, callback) } // callback function
  );
  
  // if Ajax CAPTCHA validation timeouts, fall back to full form postback
  $("#" + formId).ajaxError(function(LBD_ValidationRequest, settings, err) { 
    LBD_PromptParent.removeChild(LBD_ValidationPrompt);
    this.submit(); 
  });
}

function LBD_ProcessValidationResult(result, callback) 
{ 
  // when the validation result arrives, remove validation status indicator
  LBD_PromptParent.removeChild(LBD_ValidationPrompt);

  if(!result) 
  { // CAPTCHA validation failed, reset the CAPTCHA
    LBD_ReloadImage(captchaImageId);
    LBD_CodeInput.value = '';
  }

  if ("function" == typeof(callback)) 
  { // invoke the registered callback function
    callback(result);
  }
}

function LBD_EndValidation(result) 
{
  if(result) 
  { // CAPTCHA validation passed, submit the form to the server
    LBD_ErrorPrompt.style.visibility = 'hidden';
    LBD_ValidationResult = true;
    document.getElementById(formId).submit();
  } 
  else
  { // CAPTCHA validation failed, show error message
    LBD_ErrorPrompt.style.visibility = 'visible';
  }
}