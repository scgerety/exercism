pub fn reverse(input: &str) -> String {
    let reversed = input.chars().rev();
    let mut string = String::new();
    for c in reversed {
        string.push(c);
    }
    return string;
}
