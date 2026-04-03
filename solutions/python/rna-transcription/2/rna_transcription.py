TO_RNA = str.maketrans("GCTA", "CGAU")


def to_rna(dna_strand):
    """Converts DNA sequence to its RNA complement.

    :param dna_strand: str A string of letters representing DNA nucleotides
    :return: str A string of letters representing the complementary RNA nucleotides
    """
    return dna_strand.translate(TO_RNA)
