import re
import pandas as pd

raw_path = "data/raw/"

engine = "reli_engine.txt"
g3t1_1 = "g3t1_1.txt"
g3t1_2 = "g3t1_2.txt"
g3t1_3 = "g3t1_3.txt"
g3t1_4 = "g3t1_4.txt"
g3t1_5 = "g3t1_5.txt"
g3t1_6 = "g3t1_6.txt"
g4t1 = "g4t1.txt"
param_adapter = "param_adapter.txt"
enactor = "enactor.txt"
injector = "injector.txt"
logger = "logger.txt"
patient = "patient.txt"
collector = "collector.txt"
data_access = "data_access.txt"
rosout = "rosout.txt"
master = "master.txt"

modules = [engine, g3t1_1, g3t1_2, g3t1_3, g3t1_4, g3t1_5, g3t1_6, g4t1, param_adapter, enactor, injector, logger, patient, collector, data_access, rosout, master]


def read_file(file):
    with open (file , "r") as myfile:
        return myfile.readlines()

def match_regex(file_read):
    results = [re.findall('bsn\s*\d{4}\s*(\d+\.?\d+)\s*(\d+\.?\d+).*\.(launch|log)', line) for line in a]
    return [res[0] for res in results if len(res) > 0]

a = read_file(raw_path + g3t1_1)
results = match_regex(a)
tb = pd.DataFrame(results, columns=['cpu','mem','nome'])
tb = tb.assign(
            cpu = tb.cpu.astype(float),
            mem = tb.mem.astype(float),
        )
tb.sum()

# for module in modules:
#     with open(raw_path+module, "r") as raw_data:
#         content = raw_data.read()

