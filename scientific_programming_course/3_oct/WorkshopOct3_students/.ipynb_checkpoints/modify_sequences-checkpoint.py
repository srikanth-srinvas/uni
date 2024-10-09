from Bio import SeqIO

count = 0

with open("protein_sequences.faa", "w") as output:
    for record in SeqIO.parse("input.faa", "fasta"):
        if len(record.seq) < 750:
            if count < 1000:
                new_seq = record.seq + "*"
                new_id = str(record.id) + " id" + str(count)
                output.write(">" + new_id + "\n" + str(new_seq) + "\n")
                count += 1
            else:
                break