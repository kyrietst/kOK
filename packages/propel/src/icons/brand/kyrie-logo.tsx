import * as React from "react";
import type { ISvgIcons } from "../type";

export function KyrieLogo({
  width = "32",
  height = "32",
  color = "currentColor",
  className,
  ...props
}: ISvgIcons) {
  return (
    <svg
      width={width}
      height={height}
      viewBox="0 0 120 40"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      {...props}
    >
      {/* Grupo para o "K" espelhado */}
      <g transform="scale(-1, 1) translate(-40, 0)">
        <text
          x="5"
          y="32"
          fill={color}
          fontSize="40"
          fontWeight="900"
          fontFamily="ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, sans-serif"
          letterSpacing="-0.05em"
        >
          K
        </text>
      </g>

      {/* Grupo para o "OS" normal */}
      <text
        x="50"
        y="32"
        fill={color}
        fontSize="40"
        fontWeight="900"
        fontFamily="ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, sans-serif"
        letterSpacing="-0.05em"
      >
        OS
      </text>
      {/* Ponto tecnológico azul */}
      <circle cx="105" cy="12" r="4" fill="#3F76FF" />
    </svg>
  );
}
