
const range = document.querySelector('#range');
const label = document.querySelector('#range-label');

range.addEventListener('input',(e) => {
    const value = e.target.value;
    label.textContent = value;

    let rangeWidth = getComputedStyle(e.target).getPropertyValue('width');
    let labelWidth = getComputedStyle(label).getPropertyValue('width');
    let rangeMax = +range.max;
    let rangeMin = +range.min;

    rangeWidth = +rangeWidth.substring(rangeWidth.length - 2, 0);
    labelWidth = +labelWidth.substring(labelWidth.length - 2, 0);

    const labelLeft = value * (rangeWidth / rangeMax) - labelWidth / 2 + scale(value, rangeMin, rangeMax, 10, -10);
    label.style.cssText = `left: ${labelLeft}px;`
});

function scale(num, in_min, in_max, out_min, out_max){
    return (num - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}