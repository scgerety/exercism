use std::collections::HashSet;

fn lowercase_sort(word: &str) -> Vec<char> { // Might as well lowercase and sort at the same time.
    let mut charset: Vec<char> = word.to_lowercase().chars().collect(); 
    charset.sort(); // Can't sort chars, so sort afterwards.
    charset
}

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let alphabetized_word = lowercase_sort(&word);
    let mut confirmed_anagrams = HashSet::new();
    for gram in possible_anagrams {
       if gram.to_lowercase() != word.to_lowercase() { // Better to catch this first. Lower O(n)
            let alphabetized_gram = lowercase_sort(gram);
            if alphabetized_gram == alphabetized_word { confirmed_anagrams.insert(*gram); }
        }
    }
    confirmed_anagrams
}
