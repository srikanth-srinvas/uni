import sys

def filter_proteins(input_seq):
    faulty = open("faulty_proteins.faa", "w")
    correct = open("correct_proteins.faa", "w")
    file_in = open(input_seq)
    all_seqs = file_in.readlines()
    # A header and a sequence occur in steps of 2
    for i in range(0, len(all_seqs)-1, 2):
        # Test if header is followed by a sequence, .isalpha tests for letters
        if all_seqs[i].startswith(">") and all_seqs[i+1][0].isalpha():
            # Only keep from header what is before whitespace
            new_header = all_seqs[i].strip("\n").split(" ")[0]
            old_seq = all_seqs[i+1].strip("\n")
            if old_seq.endswith("*"):
                # Remove "*" at end of sequence with slicing
                seq = old_seq[:-1]
            else:
                seq = old_seq
            # Test for an internal stop codon and "M" at beginning
            if seq.startswith("M") and "*" not in seq:
                correct.write(new_header + "\n" + seq + "\n")
            else:
                faulty.write(new_header + "\n" + seq + "\n")
        else:
            print("Check your file for errors.")
            break
    faulty.close()
    correct.close()
    file_in.close()

if __name__ == "__main__":
    input_seq = sys.argv[1]
    filter_proteins(input_seq)
    