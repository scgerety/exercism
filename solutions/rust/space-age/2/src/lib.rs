// Seconds in an Earth year
const EARTH_YEAR: f64 = 31_557_600.0;

#[derive(Debug)]
pub struct Duration(f64);

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Duration(s as f64)
    }
}

pub trait Planet {
    fn years_during(d: &Duration) -> f64;
}

macro_rules! imp_planet {
    ($($planet:ident, $in_years:literal);*) => {
        $(pub struct $planet;
        impl Planet for $planet {
            fn years_during(d: &Duration) -> f64 {
                d.0 / EARTH_YEAR / $in_years
            }
        })*
    }
}

imp_planet!{
    // A previous version included each planet's revolutions in earth years as 
    // constants. This way saves space and seems just as readable.
    Mercury, 0.2408467;
    Venus, 0.61519726;
    Earth, 1.0;
    Mars, 1.8808158;
    Jupiter, 11.862615;
    Saturn, 29.447498;
    Uranus, 84.016846;
    Neptune, 164.79132
}
