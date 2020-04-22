import numpy as np
import keras
import cv2
from datetime import datetime, timedelta
from i3d_inception import Inception_Inflated3d
import tensorflow as tf
class FinalModel():
    def __init__(self, model_path):
        self.before_IMG_WIDTH = 256
        self.before_IMG_HEIGHT = 256

        self.IMG_WIDTH = 224
        self.IMG_HEIGHT = 224

        self.img_list = None
        self.classes = ["Assault", "Normal", "Swoon"]
        self.frame_rate = 0
        self.fontScale = 0.5
        self.fontPosition_X = 0
        self.fontPosition_Y = 30
        self.nbFrame = 16
        self.graph = tf.get_default_graph()
        self.model_path = model_path
        self.model = self.load_model()


    def define_model(self):
        i3d = Inception_Inflated3d(include_top=False,
                weights=None,
                input_tensor=None,
                input_shape=(16, 224, 224, 3),
                dropout_prob=0.5,
                endpoint_logit=True,
                classes=3)
        model = keras.models.Sequential()
        model.add(i3d)
        model.add(keras.layers.Flatten())
        model.add(keras.layers.Dropout(0.5))
        model.add(keras.layers.Dense(3, activation="softmax"))
        return model

    def load_model(self):
        model = self.define_model()
        model.load_weights(self.model_path)
        return model

    def predict(self, input_img):
        presentTime = datetime.now()
        frame_x = cv2.resize(input_img.copy(), (self.before_IMG_WIDTH, self.before_IMG_HEIGHT))
        frame_x = (frame_x - frame_x.mean()) / frame_x.std()
        frame_x = self.crop_center(frame_x)
        if self.img_list is None:
            self.img_list = np.expand_dims(frame_x, axis=0)
        else:
            if self.img_list.shape[0] != self.nbFrame:
                self.img_list = np.vstack((self.img_list, np.expand_dims(frame_x, axis=0)))
            else:
                self.img_list = np.vstack((self.img_list[1:], np.expand_dims(frame_x, axis=0)))

        if self.img_list is not None:
            if self.img_list.shape[0] == self.nbFrame:
                # 딥러닝 예측 부분
                with self.graph.as_default():
                    action = self.classes[np.argmax(self.model.predict(np.expand_dims(self.img_list, axis=0))[0])]

                cv2.putText(input_img, str(presentTime)[:-7] +"   "+ action, (self.fontPosition_X, self.fontPosition_Y), cv2.FONT_HERSHEY_SIMPLEX,
                         self.fontScale, (0, 0, 255), 2)

        # if (self.frame_rate % read_fps) == 0:
        #     self.frame_rate = 0
        #     presentTime += timedelta(seconds = 1)
        self.frame_rate += 1
        return input_img
    
    # source : https://github.com/OanaIgnat/i3d_keras/blob/e62e834f0d0ad90d4de1b067ac6dc55a33d03969/src/preprocess.py#L46
    def crop_center(self, img):
        y, x, c = img.shape

        startx = x // 2 - (self.IMG_WIDTH // 2)
        starty = y // 2 - (self.IMG_HEIGHT // 2)
        return img[starty:starty + self.IMG_HEIGHT, startx:startx + self.IMG_WIDTH]
