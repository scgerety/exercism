use std::fmt;

const MINUTES_PER_HOUR: i32 = 60;
const HOURS_PER_DAY: i32 = 24;
const MINUTES_PER_DAY: i32 = MINUTES_PER_HOUR * HOURS_PER_DAY;

#[derive(Debug, PartialEq)]
pub struct Clock(i32); // Pass in a number of minutes. 

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_minutes = (hours * MINUTES_PER_HOUR + minutes)
            .rem_euclid(MINUTES_PER_DAY); // Using .rem_euclid() helps avoid the issues with
                                          // negative numbers and modulo
        Self(total_minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let new_minutes = self.0 + minutes;
        Self::new(0, new_minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let display_minutes = self.0.rem_euclid(MINUTES_PER_HOUR);
        let display_hours = self.0 / MINUTES_PER_HOUR;
        write!(f, "{:02}:{:02}", display_hours, display_minutes)
    }
}
