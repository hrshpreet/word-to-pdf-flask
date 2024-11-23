# Flask DOCX to PDF Converter

This project is a Flask-based web application that converts `.docx` files to `.pdf` format and extracts metadata from uploaded files. It is designed for easy use and deployment.

---

## Features

- **DOCX to PDF Conversion**: Converts `.docx` files to `.pdf` using LibreOffice in headless mode.
- **Metadata Extraction**: Extracts details such as:
  - Author
  - Title
  - Subject
  - Keywords
  - Creation and modification dates
  - Word count
  - Paragraph count
  - File size
- **File Size Validation**: Limits uploads to files under 10 MB.
- **Error Handling**: Graceful error messages for invalid file types, oversized files, or conversion failures.

---

## Requirements

- **Python**: Version 3.8 or later
- **LibreOffice**: Installed on the system for file conversion
- **Python Libraries**:
  - `flask`
  - `python-docx`

---

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. Install Dependencies:
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    pip install -r requirements.txt
    ```

3. Install LibreOffice:
    ```bash
    sudo apt install libreoffice
    ```

4. Run the Application:
    ```bash
    python app.py
    ```
    The application will be accessible in your browser at http://127.0.0.1:5000
---

## API Endpoints

### **`GET /`**

- **Description**: Serves the main page for file uploads.
- **Request**: 
  - No parameters required.
- **Response**:
  - **Status Code**: `200 OK`
  - **Body**: Renders the `index.html` template, which provides the file upload interface.

---

### **`POST /convert`**

- **Description**: Converts uploaded `.docx` files to `.pdf` and extracts metadata from the file.
- **Request**:
  - **File**: A `.docx` file uploaded using the form field named `file`.
- **Response**:
  - **Success (`200 OK`)**:
    - **Body**: 
      ```json
      {
        "output": "/static/converted_pdfs/filename.pdf",
        "metadata": {
          "author": "Author Name",
          "title": "Document Title",
          "subject": "Subject",
          "keywords": "Keywords",
          "created": "Creation Date",
          "modified": "Modification Date",
          "word_count": 1234,
          "paragraph_count": 56,
          "size": 123456
        }
      }
      ```
  - **Error (`400 Bad Request`)**: If no file is uploaded or if the uploaded file is not a `.docx`.
    - **Body**:
      ```json
      {
        "error": "Invalid file type. Only .docx files are allowed."
      }
      ```
  - **Error (`413 Payload Too Large`)**: If the file exceeds the maximum allowed size of 10 MB.
    - **Body**:
      ```json
      {
        "error": "File is too large. Maximum size allowed is 10 MB."
      }
      ```
  - **Error (`500 Internal Server Error`)**: If an error occurs during the conversion process.
    - **Body**:
      ```json
      {
        "error": "Conversion failed: <error-message>"
      }
      ```

---
