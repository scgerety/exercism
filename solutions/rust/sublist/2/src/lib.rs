#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

fn find_needle<T: PartialEq>(needle: &[T], haystack: &[T]) -> bool {
    if needle.is_empty() { true }
    else {
        let found_it = haystack.windows(needle.len()).find(|i| i == &needle);
        if found_it != None { true }
        else { false }
    }    
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {
    if _first_list == _second_list { Comparison::Equal }
    else if find_needle(_first_list, _second_list) { Comparison::Sublist }
    else if find_needle(_second_list, _first_list) { Comparison::Superlist }
    else { Comparison::Unequal }
}
