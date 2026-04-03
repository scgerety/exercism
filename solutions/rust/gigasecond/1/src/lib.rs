use time::Duration;
use time::PrimitiveDateTime as DateTime;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    const GIGASECOND: Duration  = Duration::seconds(1000000000);
    let end: DateTime = start + GIGASECOND;
    return end;
}