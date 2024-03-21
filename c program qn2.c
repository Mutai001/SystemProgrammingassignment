#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

int main() {
  int fd; // File descriptor
  char *mytext = "Hello World\n";
  char buffer[1024];

  // Open the file in read-write mode
  fd = open("myfile.txt", O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);

  // Check if opening the file was successful
  if (fd == -1) {
    perror("open");
    return 1;
  }

  // Write "Hello World" to the file
  write(fd, mytext, strlen(mytext));

  // Reset the file pointer to the beginning of the file
  lseek(fd, 0, SEEK_SET);

  // Read the contents of the file into the buffer
  read(fd, buffer, sizeof(buffer));

  // Print the contents of the buffer
  printf("Read from file: %s\n", buffer);

  // Close the file
  close(fd);

  return 0;
}
