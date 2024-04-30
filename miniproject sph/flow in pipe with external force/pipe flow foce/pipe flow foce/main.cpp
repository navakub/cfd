#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <glm.hpp>
#include <iostream>
#include <cmath>


#include "SPH.cpp"
#include "SystemParticles.h"


const int WIDTH = 1360;
const int HEIGHT = 768;

const float timeEnd = 10.f; // sec
const float timeStep = 0.1f; // sec

const float D = 1.f;
const float mass = 0.1;
const float SPEED = 0.01;
int index = 0;

void on_keydown(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) /* press ESC to exit */ glfwSetWindowShouldClose(window, GL_TRUE);
}

// pipe
void constructPipe(float diameter) {
    glLineWidth(5);

    glBegin(GL_LINES);
    glVertex2f(-1, diameter / 2.0f);
    glVertex2f(1, diameter / 2.0f);
    glEnd();

    glBegin(GL_LINES);
    glVertex2f(-1, -diameter / 2.0f);
    glVertex2f(1, -diameter / 2.0f);
    glEnd();
}


// main loop 
int main(void)
{
    float t = glfwGetTime(); //start here
    GLFWwindow* window;
    

    /* Initialize the library */
    if (!glfwInit())
        return -1;

    glewInit();

    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(WIDTH, HEIGHT, "SPH Simulation", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        return -1;
    }

    glfwSetKeyCallback(window, on_keydown);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);


    /* Make the window's context current */
    glfwMakeContextCurrent(window);

    /* Loop until the user closes the window */
    while (!glfwWindowShouldClose(window))
    {
        /* Render here */

        /* WORKING HERE */
        
        SystemParticles sys;
        sys.mass = mass;
        sys.D = D;
        sys.speed = SPEED;

        sys.initParticles();
        glClear(GL_COLOR_BUFFER_BIT);
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        constructPipe(D);
        sys.drawParticles();

        glEnd();
        t += timeStep; //update time
        
            
        /* END WORKING HERE */

        /* Swap front and back buffers */
        glfwSwapBuffers(window);

        /* Poll for and process events */
        glfwPollEvents();
        std::cout << t << std::endl;
    }

    glfwTerminate();
    return 0;
}