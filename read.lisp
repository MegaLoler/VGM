(in-package :vgm)

(defun read-bytes (stream &optional (bytes 1) (endianness 'little))
  "Read a number of bytes from a stream."
  (declare (type (member little big) endianness))
  (loop
     :with data = 0
     :for x :from 0 :to (1- bytes)
     :for y :from (1- bytes) :downto 0
     :for offset = (case endianness
		     (big y)
		     (little x))
     :do (setf (ldb (byte 8 (* 8 offset)) data)
	       (read-byte stream))
     :finally (return data)))

(defun read-vgm-file (stream)
  "Read and parse vgm file data from a stream."
  (make-vgm-header
   :fcc-vgm (read-bytes stream 4)))

(defun load-vgm-file (filespec)
  "Load a vgm file."
  (with-open-file (stream filespec
			  :element-type '(unsigned-byte 8))
    (read-vgm-file stream)))

(load-vgm-file "test/song.vgm")
