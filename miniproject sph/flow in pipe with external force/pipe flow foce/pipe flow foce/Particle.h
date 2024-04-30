#pragma once
class Particles 
{ /*public:

    static const int numY = 150; static const int numX = 50;
	// attributes
	float mass;
	float size;
    float xPos[numY][numX], yPos[numY][numX];
    float xVel[numY][numX], yVel[numY][numX];
    float xAcc[numY][numX], yAcc[numY][numX];

    void initParticles() {
        for (int i = 0; i < numY; i++) {
            for (int j = 0; j < numX; j++) {
                xPos[i][j] = -1.0f + float(j + 1) * 2.0f / float(numX);
                yPos[i][j] = -R / 2.0f + float(i + 1) * R / float(numY);
            }
        }
    }

    void updatePos(char d, float pos) {
        pos = pos + 1;
    }

    void drawParticles(float frame) {
        glPointSize(6);
        glBegin(GL_POINTS);
        for (int i = 0; i < numY; i++) {
            for (int j = 0; j < numX; j++) {
                xPos[i][j] = xPos[i][j] + frame * SPEED;
                if (xPos[i][j] > 1) {
                    if (fmod(ceil(xPos[i][j]), 2.f) == 0) {
                        updatePos('x',xPos[i][j]);
                    }
                    else {
                        updatePos('y', yPos[i][j]);
                    }
                }
                glVertex3f(xPos[i][j], yPos[i][j], 0.0f);
            }
        }
        glEnd();
    }

	

    */
};

