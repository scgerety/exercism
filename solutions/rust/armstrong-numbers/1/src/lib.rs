pub fn is_armstrong_number(num: u32) -> bool {
    // true if {num} is an armstrong number"
    
    // Make {num} mutable
    let mut number = num;
    // Create a new vector for squaring and summing
    let mut num_vec = Vec::<u32>::new();
    // Add digits to the vector
    while number != 0 {
        let remainder = number % 10;
        num_vec.insert(0, remainder);
        number = (number - remainder) / 10;
    }
    
    // Find length of {num_vec} to raise to correct power
    let digits: u32 = num_vec.len().try_into().unwrap();
    // Iterate over digits in {num_vec}, squaring, then summing
    let arm_candidate: u64 = num_vec.iter().map(|x| x.pow(digits) as u64).sum();

    return arm_candidate == num as u64;

}
