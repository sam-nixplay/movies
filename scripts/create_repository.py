import os
import subprocess

# Ask for repository name
repository_name = input("Enter the name of the repository: ")

# Set the default directory paths
default_domain_dir_path = f'../lib/src/domain/repositories/{repository_name.lower()}_repository'
default_data_dir_path = f'../lib/src/data/repositories/{repository_name.lower()}_repository'

# Ask for the custom domain directory path
domain_dir_path = input(f"Enter the path to the domain repositories directory (default: {default_domain_dir_path}): ") or default_domain_dir_path

# Ask for the custom data directory path
data_dir_path = input(f"Enter the path to the data repositories directory (default: {default_data_dir_path}): ") or default_data_dir_path

# Ignore if repository name is empty
if not repository_name:
    print("Repository name is empty. Skipping...")
    exit()

# Create the domain repository directory if it does not exist
os.makedirs(domain_dir_path, exist_ok=True)

# Create the data repository directory if it does not exist
os.makedirs(data_dir_path, exist_ok=True)

# Define the domain repository file path
domain_file_path = os.path.join(domain_dir_path, f"{repository_name.lower()}_repository.dart")

# Define the data repository file path
data_file_path = os.path.join(data_dir_path, f"{repository_name.lower()}_repository_impl.dart")

# Check if the files already exist
if os.path.isfile(domain_file_path) or os.path.isfile(data_file_path):
    print(f"A file with the name {repository_name.lower()}_repository.dart or {repository_name.lower()}_repository_impl.dart already exists.")
    exit()

# Define the domain repository template
domain_template = f"""
import 'package:path/to/base_repository.dart';

abstract class {repository_name}Repository extends BaseRepository {{
}}

"""

# Define the data repository template
data_template = f"""
import 'package:path/to/{repository_name.lower()}_repository.dart';

class {repository_name}RepositoryImpl extends {repository_name}Repository {{
}}
"""

# Write the domain repository to a new .dart file
with open(domain_file_path, "w") as file:
    file.write(domain_template)

# Write the data repository to a new .dart file
with open(data_file_path, "w") as file:
    file.write(data_template)

print(f"Created new domain repository: {repository_name.lower()}_repository.dart")
print(f"Created new data repository: {repository_name.lower()}_repository_impl.dart")
