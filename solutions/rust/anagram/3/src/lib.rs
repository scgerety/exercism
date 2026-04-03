use std::collections::HashSet;

fn lowercase_sort(word: &str) -> Vec<char> { // Might as well lowercase and sort at the same time.
    let mut charset: Vec<char> = word.to_lowercase().chars().collect(); 
    charset.sort(); // Can't sort chars, so sort afterwards.
    charset
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let alphabetized_word = lowercase_sort(&word);
    possible_anagrams
        .iter()
        .cloned() // This is necessary to prevent double reference
        .filter(|x| x.to_lowercase() != word.to_lowercase() && lowercase_sort(*x) == alphabetized_word)
        .collect::<HashSet<&str>>()
}
