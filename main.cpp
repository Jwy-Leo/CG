#include <stdio.h>
#include <stdlib.h>
#include <GL/glut.h>
// #include "build_my_lib/include/OpenGL_information.h"
void teapot(int,char**);
void Create_glut_windows(int,char**);
void InitGL();
void display();
// void OpenGL_information();
int main(int argc, char **argv)
{
    OpenGL_information();
    teapot(argc,argv);
    glutMainLoop();
    //vec4 vertices[3] = vec4[3](vec4(0.25,-0.25,0.5,1.0),vec4(-0.25,-0.25,0.5,1.0),vec4(0.25,0.25,0.5,1.0));
    //gl_Position = vertoces[gl_VertexID]
    
    return 0;
}
void teapot(int argc,char ** argv)
{
    Create_glut_windows(argc,argv);
    InitGL();
    display();
}
void Create_glut_windows(int argc,char ** argv)
{
    glutInit(&argc,argv);
    // glutInitDisplayMode(GLUT_RGBA |GLUT_DOUBLE |GLUT_DEPTH);    
    // glutInitWindowPosition(100,100);
    // glutInitWindowSize(600,600);

    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);
    glutInitWindowPosition(0,0);
    glutInitWindowSize(300,300);

    glutCreateWindow("SimpleApp");
}
void InitGL()
{
    glClearColor(1.0f,1.0f,1.0f,1.0f);
    glEnable(GL_DEPTH_TEST);
    glDisable(GL_LIGHTING);
    

    // glClearColor(0.0, 0.0, 0.0, 0.0);
	// glMatrixMode(GL_PROJECTION);
	glOrtho(-5, 5, -5, 5, 5, 15);
	// glMatrixMode(GL_MODELVIEW);
	gluLookAt(0, 0, 10, 0, 0, 0, 0, 1, 0);
}
void display()
{
	glClear(GL_COLOR_BUFFER_BIT);
		
	glColor3f(1.0, 0, 0);
	glutWireTeapot(3);
    
	glFlush();
}
void triangel()
{
//   Plane describe VAO   
    GLuint Vertex_Array_ID;
    // glGenVertexArrays()
}
void OpenGL_information()
{
    const GLubyte* name = glGetString(GL_VENDOR); 
    const GLubyte* biaoshifu = glGetString(GL_RENDERER); 
    const GLubyte* OpenGLVersion =glGetString(GL_VERSION);
    const GLubyte* gluVersion= gluGetString(GLU_VERSION); 
    printf("OpenGL实现厂商的名字：%s\n", name);
    printf("GPU：%s\n", biaoshifu);
    printf("OpenGL version ：%s\n",OpenGLVersion );
    printf("OGLU工具库版本：%s\n", gluVersion);
}