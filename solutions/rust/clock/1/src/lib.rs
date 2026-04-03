use std::{fmt, f32};

const MINUTES_PER_HOUR: i32 = 60;
const HOURS_PER_DAY: i32 = 24;

#[derive(Debug)]
#[derive(PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_hours = (hours + (minutes as f32 / MINUTES_PER_HOUR as f32).floor() as i32).rem_euclid(HOURS_PER_DAY);
        let total_minutes = minutes.rem_euclid(MINUTES_PER_HOUR);
        Self {
            hours: total_hours,
            minutes: total_minutes,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let new_hours = self.hours;
        let new_minutes = self.minutes + minutes;
        Self::new(new_hours, new_minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
