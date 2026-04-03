pub fn reverse(input: &str) -> String {
    let char_vec: Vec<char> = input.chars()
                                   .collect();
    let reversed: String = char_vec.iter()
                                   .rev()
                                   .collect();
    return reversed;
}
