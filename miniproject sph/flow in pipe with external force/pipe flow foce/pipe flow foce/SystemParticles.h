#pragma once
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include "SPH.h"

class SystemParticles
{
public:
	static const int numX = 49;
	static const int numY = 24;
    //float timeStep;

    float mass;
	float D;

	float xPos[numY][numX]; float yPos[numY][numX];
	float xVel[numY][numX]; float yVel[numY][numX];
	float xAcc[numY][numX]; float yAcc[numY][numX];
    float speed;

    void setxPos(float x_, int iy, int ix) {
        xPos[iy][ix] = x_;
    }

    void initParticles() {
        for (int i = 0; i < numY; i++) {
            for (int j = 0; j < numX; j++) {
                xPos[i][j] = -1.0f + float(j + 1) * 2.0f / float(numX);
                yPos[i][j] = -D / 2.0f + float(i + 1) * D / float(numY);
            }
        }
    }

    void drawParticles() {
        glPointSize(6);
        glBegin(GL_POINTS);

        for (int i = 0; i < numY; i++) {
            for (int j = 0; j < numX; j++) {
                move(i,j);
                glVertex3f(xPos[i][j], yPos[i][j], 0.0f);
            }
        }
    }

	void move(int iy, int ix) {
        /* test */
        //for (int i = 0; i < numY; i++) {
        //    for (int j = 0; j < numX; j++) {
        //        xPos[i][j] += speed; //move here
        //        if (xPos[i][j] > 1) {
        //            if (fmod(ceil(xPos[i][j]), 2.f) == 0) {
        //                xPos[i][j] = fmod(xPos[i][j], 1.f) - 1;
        //            }
        //            else {
        //                xPos[i][j] = fmod(xPos[i][j], 1.f);
        //            }
        //        }
        //    }
        //}

        setxPos(xPos[iy][ix]+speed,iy,ix); //move here
        if (xPos[iy][ix] > 1) {
            if (fmod(ceil(xPos[iy][ix]), 2.f) == 0) {
                xPos[iy][ix] = fmod(xPos[iy][ix], 1.f) - 1;
            }
            else {
                xPos[iy][ix] = fmod(xPos[iy][ix], 1.f);
            }
        }
        //std::cout << xPos[numY-1][numX - 1] << ',' << yPos[numY - 1][numX - 1] << std::endl;

        /* SPH implementation */
        //SPH sph;
	}

};

