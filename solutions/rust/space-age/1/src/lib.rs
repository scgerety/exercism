// Seconds in an Earth year
const EARTH_YEAR: f64 = 31_557_600.0;
// Time it takes for each planet to revolve around the Sun in Earth years
const EARTH: f64 = 1.0;
const MERCURY: f64 = 0.2408467;
const VENUS: f64 = 0.61519726;
const MARS: f64 = 1.8808158;
const JUPITER: f64 = 11.862615;
const SATURN: f64 = 29.447498;
const URANUS: f64 = 84.016846;
const NEPTUNE: f64 = 164.79132;

#[derive(Debug)]
pub struct Duration;

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        s.into()
    }
}
impl From<&Duration> for f64 {
    fn from(dur: &Duration) -> Self {
        dur.into()
    }
}

pub trait Planet {
    fn years_during(d: &Duration) -> f64;
}

macro_rules! imp_planet {
    ($($planet:ident, $in_years:ident);*) => {
        $(pub struct $planet;
        impl Planet for $planet {
            fn years_during(d: &Duration) -> f64 {
                f64::from(d) / EARTH_YEAR * $in_years
            }
        })*
    }
}

imp_planet!{
    Mercury, MERCURY;
    Venus, VENUS;
    Earth, EARTH;
    Mars, MARS;
    Jupiter, JUPITER;
    Saturn, SATURN;
    Uranus, URANUS;
    Neptune, NEPTUNE
}
