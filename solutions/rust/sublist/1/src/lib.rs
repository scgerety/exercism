#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

fn find_needle<T: PartialEq>(needle: &[T], haystack: &[T]) -> bool {
    // Thanks to Martin Berglund on stackoverflow for their answer and CollaborativeLearner for the question
    // https://stackoverflow.com/questions/57118537/rust-how-can-i-search-a-vec-for-a-subset-and-find-the-start-index-of-the-sub
    let mut found_it = None;
    if needle == &[] { true }
    else {
        for (_position, window) in haystack.windows(needle.len()).enumerate() {
            if window == needle {
                found_it = Some(window);
            }
        }
        if found_it != None { true }
        else { false }
    }    
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {
    //"Determine if the first list is equal to, sublist of, superlist of or unequal to the second list."
    if _first_list == _second_list { Comparison::Equal }
    else if find_needle(_first_list, _second_list) { Comparison::Sublist }
    else if find_needle(_second_list, _first_list) { Comparison::Superlist }
    else { Comparison::Unequal }
}
