DNA_TO_RNA1 = {
    # Convert to lowercase first to prevent flipping C back to G or A back to T.
    "G": "c",
    "C": "g",
    "T": "a",
    "A": "u"
}


def to_rna(dna_strand):
    """Converts DNA sequence to its RNA complement.

    :param dna_strand: str A string of letters representing DNA nucleotides
    :return: str A string of letters representing the complementary RNA nucleotides
    """
    for dna, rna in DNA_TO_RNA1.items():
        dna_strand = dna_strand.replace(dna, rna)

    return dna_strand.upper()
