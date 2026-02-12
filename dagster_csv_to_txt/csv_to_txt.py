import csv
from dagster import op, job

@op
def read_csv():
    data = []
    with open("healthcare_dataset.csv", "r") as file:
        reader = csv.reader(file)
        for row in reader:
            data.append(row)
    return data

@op
def write_txt(data):
    with open("healthcare_dataset.txt", "w") as file:
        for row in data:
            file.write(",".join(row) + "\n")

@job
def csv_to_txt_job():
    write_txt(read_csv())
