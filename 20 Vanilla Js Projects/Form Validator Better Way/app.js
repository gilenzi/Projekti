'use-strict';

const validateForm = formSelector => {
    const formElement = document.querySelector(formSelector);

    const validationOptions = [
        {
            attribute: 'customMaxLength',
            isValid: input => input.value && input.value.length <= parseInt(input.getAttribute('customMaxLength')),
            errorMessage: (input,label) => `${label.textContent} needs to be less than ${input.getAttribute('customMaxLength')} characters`
        },
        {
            attribute: 'minLength',
            isValid: input => input.value && input.value.length >= parseInt(input.minLength),
            errorMessage: (input, label) => `${label.textContent} needs to be at least ${input.minLength} characters.`
        },
        {
            attribute: 'pattern',
            isValid: input => {
                const patternRegex = new RegExp(input.pattern);
                return patternRegex.test(input.value);
            },
            errorMessage: (input, label) => `Not a valid ${label.textContent}`
        },
        {
            attribute: 'required',
            isValid: input => input.value.trim() !== '',
            errorMessage: (input, label) => `${label.textContent} is required`
        },
        {
            attribute: 'match',
            isValid: input => {
                const matchSelector = input.getAttribute('match');
                const matchedElement = document.querySelector(`#${matchSelector}`);
                return matchedElement && matchedElement.value.trim() === input.value.trim();
            },
            errorMessage: (input, label) => {
                const matchSelector = input.getAttribute('match');
                const matchedSelector = document.querySelector(`#${matchSelector}`);

                return `${label.textContent} should match Password`;
            }
        }

    ];

    const validateSingleFormGroup = formGroup => {
        const label = formGroup.querySelector('label');
        const input = formGroup.querySelector('input, textarea');
        const errorContainer = formGroup.querySelector('.error');
        const errorIcon = formGroup.querySelector('.error-icon');
        const successIcon = formGroup.querySelector('.success-icon');

        let formGroupError = false;

        for(let i = 0 ; i < validationOptions.length ; i++){
            let option = validationOptions[i];

            if(input.hasAttribute(option.attribute) && !option.isValid(input)){
                errorContainer.textContent = option.errorMessage(input, label);
                input.classList.add('border-red-700');
                input.classList.remove('border-green-700');
                successIcon.classList.add('hidden');
                errorIcon.classList.remove('hidden');
                formGroupError = true;
            }
        }
        if(!formGroupError) {
            errorContainer.textContent = '';
            input.classList.add('border-green-700');
            input.classList.remove('border-red-700');
            successIcon.classList.remove('hidden');
            errorIcon.classList.add('hidden');

        }
    }



    formElement.setAttribute('novalidate', '');

    /* Validate update dynamically when user click on input fields not entire form  */
    Array.from(formElement.elements).forEach(element => {
        element.addEventListener('blur', event => {
            validateSingleFormGroup(event.srcElement.parentElement.parentElement);
        });
    })

    formElement.addEventListener('submit', (e) => {
        e.preventDefault();
        validateAllFormGroups(formElement);
    })

    const validateAllFormGroups = formToValidate => {
        const formGroups = Array.from(formToValidate.querySelectorAll('.form-group '));
        
        formGroups.forEach(formGroup => {
            validateSingleFormGroup(formGroup);
        })
    }
}

validateForm('#registration-form');