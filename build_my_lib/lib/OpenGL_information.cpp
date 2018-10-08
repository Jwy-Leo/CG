// Be included in util/system_info/
#ifndef _STDIO_H_
#define _STDIO_H_
#include <stdio.h>
#endif

#ifndef _GLUT_H_
#define _GLUT_H_
#include <GL/glut.h>
#endif

void OpenGL_information()
{
    const GLubyte* name = glGetString(GL_VENDOR); 
    const GLubyte* biaoshifu = glGetString(GL_RENDERER); 
    const GLubyte* OpenGLVersion =glGetString(GL_VERSION);
    const GLubyte* gluVersion= gluGetString(GLU_VERSION); 
    printf("OpenGL实现厂商的名字：%s\n", name);
    printf("GPU：%s\n", biaoshifu);
    printf("OpenGL version ：%s\n",OpenGLVersion );
    printf("GLU工具库版本：%s\n", gluVersion);
} 