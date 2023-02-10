import React from "react";
import { Container } from "react-bootstrap";
import { ThemeProvider, Row, Col } from "react-bootstrap";
import { SpeakNavbar } from "./components/SpeakNavbar";
import { SpeakWindow } from "./components/SpeakWindow";

const App = () => {
  return (
    <ThemeProvider>
      <SpeakNavbar />
      <Container>
        <Row>
          <Col>
            <SpeakWindow />
          </Col>
        </Row>
      </Container>
    </ThemeProvider>
  );
};

export { App };
