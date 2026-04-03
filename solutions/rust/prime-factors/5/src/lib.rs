use std::f64;

pub fn factors(n: u64) -> Vec<u64> {
    // This should calculate the prime factors of {n}
    let mut vector = Vec::<u64>::new();
    let mut number = n;
    let n_root = (n as f64).sqrt().ceil() as u64; 
    // Loop through numbers lower than the square root + 1 of {n}
    let factor_set = (2..=n_root).filter(|x| (*x == 2) || (x % 2 != 0));
    for i in factor_set {
        while number % i == 0 {
            vector.push(i);
            number = number / i;
        }
    }
    // Push the remaining factor onto {vector}
    if number > 1 { vector.push(number); }
    vector
}
