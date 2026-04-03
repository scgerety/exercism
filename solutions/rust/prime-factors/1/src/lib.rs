use std::f64;

pub fn factors(n: u64) -> Vec<u64> {
    // This should calculate the prime factors of {n}
    // Set up a vector to store prime factors
    let mut vector = Vec::<u64>::new();
    // Set a mutable variable to divide by prime factors
    let mut number = n;
    // Set square root of {n} for greatest possible prime factor
    let root_n_plus = (n as f64).sqrt().ceil() as u64; 

    // Loop through numbers lower than the square root + 1 of {n}
    for i in 2..=root_n_plus {
        while number % i == 0 {
            vector.push(i);
            number = number / i;
        }
    }

    // Push the remaining factor onto {vector}
    if number > 1 {
        vector.push(number);
    }
    
    
    // Return {vector}
    return vector;
}
