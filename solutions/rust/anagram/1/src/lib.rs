use std::collections::HashSet;

fn lowercase_sort(word: &str) -> Vec<char> {
    let mut charset: Vec<char> = word.to_ascii_lowercase().chars().collect();
    charset.sort();
    charset
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let alphabetized_word = lowercase_sort(&word);
    let mut confirmed_anagrams = HashSet::new();
    for gram in possible_anagrams {
        if gram.to_ascii_lowercase() != word.to_ascii_lowercase() {
            let alphabetized_gram = lowercase_sort(gram);
            if alphabetized_gram == alphabetized_word { confirmed_anagrams.insert(*gram); }
        }
    }
    confirmed_anagrams
}
