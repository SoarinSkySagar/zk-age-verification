pragma circom  2.0.0;

template VerifyAge() {
    signal input dobYear;
    signal input dobMonth;
    signal input dobDay;
    signal input currentYear;
    signal input currentMonth;
    signal input currentDay;
    signal output isAdult;

    signal ageYears;
    signal ageMonths;
    signal ageDays;
    signal tempAgeYears;

    signal ageAdjustmentNeeded;
    signal monthTooEarly;
    signal dayTooEarly;

    tempAgeYears <== currentYear - dobYear;
    ageMonths <== currentMonth - dobMonth;
    ageDays <== currentDay - dobDay;

    monthTooEarly <-- (currentMonth < dobMonth) ? 1 : 0;
    dayTooEarly <-- (currentMonth == dobMonth && currentDay < dobDay) ? 1 : 0;

    ageAdjustmentNeeded <== monthTooEarly + dayTooEarly;

    ageYears <== tempAgeYears - ageAdjustmentNeeded;

    isAdult <-- ageYears >= 18 ? 1 : 0;
}

component main = VerifyAge();