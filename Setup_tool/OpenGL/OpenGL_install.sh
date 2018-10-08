sudo apt-get install build-essential
sudo apt-get install libgl1-mesa-dev
sudo apt-get install libglu1-mesa-dev
sudo apt-get install freeglut3-dev
Test_C_file_context='#include <GL/glut.h>\n

void init();
void display();

int main(int argc, char* argv[])
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);
	glutInitWindowPosition(0, 0);
	glutInitWindowSize(300, 300);
	
	glutCreateWindow("OpenGL 3D View");
	
	init();
	glutDisplayFunc(display);
	
	glutMainLoop();
	return 0;
}

void init()
{
	glClearColor(0.0, 0.0, 0.0, 0.0);
	glMatrixMode(GL_PROJECTION);
	glOrtho(-5, 5, -5, 5, 5, 15);
	glMatrixMode(GL_MODELVIEW);
	gluLookAt(0, 0, 10, 0, 0, 0, 0, 1, 0);
}

void display()
{
	glClear(GL_COLOR_BUFFER_BIT);
		
	glColor3f(1.0, 0, 0);
	glutWireTeapot(3);
	
	glFlush();
}
'
echo $Test_C_file_context > example.c
gcc example.c -o example.out -lGL -lGLU -lglut
./example.out
rm example.c
rm example.out
