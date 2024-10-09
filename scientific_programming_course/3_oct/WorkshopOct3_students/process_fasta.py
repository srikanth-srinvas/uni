import argparse

def process_fasta(input_file):
    # Hardcoded output file names
    correct_output_file = 'correct_sequences.faa'
    faulty_output_file = 'faulty_sequences.faa'

    # Initialize counters
    correct_count = 0
    faulty_count = 0

    # Open the input and output files
    with open(input_file, 'r') as infile, \
         open(correct_output_file, 'w') as correct_outfile, \
         open(faulty_output_file, 'w') as faulty_outfile:
        
        header = ''
        sequence = ''

        # Function to write a sequence to a file
        def write_sequence(header, sequence, file):
            file.write(header + '\n')
            file.write(sequence + '\n')

        for line in infile:
            line = line.strip()
            
            # If it's a header line (starts with '>'):
            if line.startswith(">"):
                if header and sequence:  # If there's a previous sequence to process:
                    if sequence_contains_faulty(sequence):
                        write_sequence(header, sequence, faulty_outfile)
                        faulty_count += 1  # Increment faulty sequence count
                    else:
                        processed_sequence = process_correct_sequence(sequence)
                        write_sequence(clean_header(header), processed_sequence, correct_outfile)
                        correct_count += 1  # Increment correct sequence count
                
                # Store the new header and reset the sequence
                header = line
                sequence = ''
            else:
                sequence += line  # Accumulate the sequence

        # Process the last sequence after the loop
        if header and sequence:
            if sequence_contains_faulty(sequence):
                write_sequence(header, sequence, faulty_outfile)
                faulty_count += 1
            else:
                processed_sequence = process_correct_sequence(sequence)
                write_sequence(clean_header(header), processed_sequence, correct_outfile)
                correct_count += 1

    # Return the summary information
    return correct_count, faulty_count

def sequence_contains_faulty(sequence):
    """
    Check if the sequence contains any internal stop codon (*) or if it doesn't start with 'M'.
    """
    return '*' in sequence[:-1] or not sequence.startswith('M')

def process_correct_sequence(sequence):
    """
    Process correct sequences by removing any stop codon at the end.
    """
    if sequence.endswith('*'):
        sequence = sequence[:-1]
    return sequence

def clean_header(header):
    """
    Remove any text after the first space in the header.
    """
    return header.split(' ')[0]

def main():
    # Argument parsing
    parser = argparse.ArgumentParser(description='Process a FASTA file to filter faulty sequences.')
    parser.add_argument('input_file', help='The input FASTA file')
    
    args = parser.parse_args()
    
    # Process the FASTA file
    correct_count, faulty_count = process_fasta(args.input_file)

    # Print summary of the processing
    print(f"Processed file: {args.input_file}")
    print(f"Number of correct sequences: {correct_count}")
    print(f"Number of faulty sequences: {faulty_count}")
    print(f"Correct sequences written to: correct_sequences.faa")
    print(f"Faulty sequences written to: faulty_sequences.faa")

if __name__ == "__main__":
    main()