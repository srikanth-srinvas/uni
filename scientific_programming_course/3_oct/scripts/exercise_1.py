def reverse_complement(dna_sequence):
    complement = {
        'A': 'T',
        'T': 'A',
        'C': 'G',
        'G': 'C'
    }
    reversed_sequence = dna_sequence[::-1]
    reverse_complement_sequence = ''.join(complement[base] for base in reversed_sequence)
    
    return reverse_complement_sequence

dna_seq = "ACGTTGCCCGTATAGAGTAGTCG"
print("Original Sequence:", dna_seq)
print("Reverse Complement:", reverse_complement(dna_seq))
