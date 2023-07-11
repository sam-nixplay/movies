import os
import json
import subprocess
import re

# Ask for model name
model_name = input("Enter the name of the model: ")

# Convert PascalCase to snake_case for file name
file_name = re.sub(r'(?<!^)(?=[A-Z])', '_', model_name).lower()
file_name += ".dart"

# Ask for the directory path
dir_path = input("Enter the path to the models directory (press Enter to use './lib/src/data/entities'): ")

# Use default directory if no directory was provided
if dir_path == "":
    dir_path = "./lib/src/data/entities"

# Ask for the path to the JSON file
json_path = input("Enter the path to the JSON file: ")

# Create the directory if it does not exist
os.makedirs(dir_path, exist_ok=True)

# Define the file path
file_path = os.path.join(dir_path, file_name)

# Check if the file already exists
if os.path.isfile(file_path):
    print(f"A file with the name {model_name.lower()}.dart already exists.")
    exit()

# Function to convert snake_case to camelCase
def snake_to_camel(snake_str):
    components = snake_str.split('_')
    return components[0] + ''.join(x.title() for x in components[1:])

# Check if the key is in snake case
def is_snake_case(s):
    return re.match("^[a-z_]*$", s) and "_" in s

params = ""

# Load the JSON data
with open(json_path, 'r') as f:
    data = json.load(f)
# Convert the JSON keys and types to Dart types
type_mapping = {
    str: 'String?',
    int: 'int?',
    float: 'double?',
    bool: 'bool?',
    list: 'List<dynamic>?',
    dict: 'Map<String, dynamic>?',
    type(None): 'dynamic'
}
# Construct the parameters string
params = ", ".join([f'@JsonKey(name: "{key}") {type_mapping[type(value)]} {snake_to_camel(key)}' if is_snake_case(key) else f'{type_mapping[type(value)]} {key}' for key, value in data.items()])
params += ","

import_snake_case = re.sub(r'(?<!^)(?=[A-Z])', '_', model_name).lower()

# Define the model template
model_template = f"""
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part '{import_snake_case}.freezed.dart';
part '{import_snake_case}.g.dart';

@freezed
class {model_name} with _${model_name} {{
  const factory {model_name}({{ {params} }}) = _{model_name};

  factory {model_name}.fromJson(Map<String, dynamic> json) => _${model_name}FromJson(json);
}}
"""

# Write the model to a new .dart file
with open(file_path, "w") as file:
    file.write(model_template)

print(f"Created new model: {model_name.lower()}.dart")

