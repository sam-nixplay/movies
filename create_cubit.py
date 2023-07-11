import os
import subprocess

# Ask for cubit name
cubit_name = input("Enter the name of the cubit: ")

# Set the default directory path
default_dir_path = './lib/src/presentation/cubits'
dir_path = input(f"Enter the path to the cubits directory (default: {default_dir_path}): ") or default_dir_path

# Ignore if cubit name is empty
if not cubit_name:
    print("Cubit name is empty. Skipping...")
    exit()

# Create the directory if it does not exist
os.makedirs(dir_path, exist_ok=True)

# Define the file paths
cubit_file_path = os.path.join(dir_path, f"{cubit_name.lower()}_cubit.dart")
state_file_path = os.path.join(dir_path, f"{cubit_name.lower()}_state.dart")

# Check if the files already exist
if os.path.isfile(cubit_file_path) or os.path.isfile(state_file_path):
    print(f"A file with the name {cubit_name.lower()}_cubit.dart or {cubit_name.lower()}_state.dart already exists.")
    exit()

# Define the cubit template
cubit_template = f"""
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/presentation/cubits/{cubit_name.lower()}_state.dart';

class {cubit_name}Cubit extends Cubit<{cubit_name}State> {{
  {cubit_name}Cubit()
      : super(const {cubit_name}State.initial());
}} 
"""

# Define the state template
state_template = f"""
import 'package:freezed_annotation/freezed_annotation.dart';

part '{cubit_name.lower()}_state.freezed.dart';

@freezed
class {cubit_name}State with _${cubit_name}State {{
  const factory {cubit_name}State.initial() = _Initial;
  const factory {cubit_name}State.pending() = _Pending;
  const factory {cubit_name}State.set() = _Set;
  const factory {cubit_name}State.error(String message) = _Error;
}}
"""

# Write the cubit to a new .dart file
with open(cubit_file_path, "w") as file:
    file.write(cubit_template)

# Write the state to a new .dart file
with open(state_file_path, "w") as file:
    file.write(state_template)

print(f"Created new cubit: {cubit_name.lower()}_cubit.dart")
print(f"Created new state: {cubit_name.lower()}_state.dart")
